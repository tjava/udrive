import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/core/utils/snack_bar.dart';
import 'package:udrive/core/utils/text_field_validators.dart';
import 'package:udrive/core/widgets/column_sized_box.dart';
import 'package:udrive/core/widgets/generic_button.dart';
import 'package:udrive/core/widgets/generic_text.dart';
import 'package:udrive/core/widgets/generic_text_form_field.dart';
import 'package:udrive/core/widgets/row_sized_box.dart';
import 'package:udrive/features/auth/auth_constants.dart';
import 'package:udrive/features/auth/domain/entities/register_payload_entity.dart';
import 'package:udrive/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:udrive/features/auth/presentation/widgets/social_auth.dart';
import 'package:udrive/locator/locate.dart';
import 'package:udrive/navigator/router.gr.dart';

class RegisterButtom extends StatefulWidget {
  const RegisterButtom({super.key});

  @override
  State<RegisterButtom> createState() => _RegisterButtomState();
}

class _RegisterButtomState extends State<RegisterButtom> {
  late final RegisterCubit _registerCubit;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late final FocusScopeNode _focusNode;

  bool _obscure = true;

  @override
  void initState() {
    super.initState();

    _registerCubit = locate<RegisterCubit>();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _registerCubit.close();

    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>.value(
      value: _registerCubit,
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(
                context: context,
                message: state.message,
                color: red,
              ),
            );
          }

          if (state is Loaded) {
            context.pushRoute(const LoginRoute());
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(
                context: context,
                message: 'Registration successful, please login.',
                color: green,
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            height: 360.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ColumnSizedBox(15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Form(
                      key: _formKey,
                      child: FocusScope(
                        node: _focusNode,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ColumnSizedBox(13.h),
                            GenericTextFormField(
                              editingController: _nameController,
                              label: lblName,
                              hint: lblNameDesc,
                              textCapitalization: TextCapitalization.sentences,
                              inputType: TextInputType.text,
                              isRequired: true,
                              isBusy: state is Loaded ? true : false,
                              onEditingComplete: () => _focusNode.nextFocus(),
                            ),
                            ColumnSizedBox(15.h),
                            GenericTextFormField(
                              editingController: _emailController,
                              label: lblEmailPhone,
                              hint: lblEmailPhoneHint,
                              textCapitalization: TextCapitalization.sentences,
                              inputType: TextInputType.emailAddress,
                              isRequired: true,
                              isBusy: state is Loaded ? true : false,
                              onEditingComplete: () => _focusNode.nextFocus(),
                            ),
                            ColumnSizedBox(15.h),
                            GenericTextFormField(
                              editingController: _passwordController,
                              label: lblPassword,
                              hint: lblPasswordHint,
                              isRequired: true,
                              isBusy: state is Loaded ? true : false,
                              obscureText: _obscure,
                              validators: [
                                containsLowercaseValidator,
                                containsUppercaseValidator,
                                containsNumericValidator,
                                containsCharacterValidator,
                                notContainWhiteSpace,
                                charactersLengthValidator(6),
                              ],
                              onEditingComplete: () => _focusNode.nextFocus(),
                              suffixIcon: Icon(
                                _obscure ? Icons.visibility_off : Icons.visibility,
                                color: inputGrey,
                              ),
                              onSuffixIconClick: () {
                                _obscure = !_obscure;
                                setState(() {});
                              },
                            ),
                            ColumnSizedBox(15.h),
                            GenericButton(
                              label: 'Create',
                              labelColor: white,
                              width: MediaQuery.of(context).size.width,
                              isBusy: state is Loaded ? true : false,
                              onClick: () async {
                                if (_formKey.currentState?.validate() ?? false) {
                                  _focusNode.unfocus();
                                  _registerCubit.register(RegisterPayloadEntity(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ColumnSizedBox(15.h),
                  const SocialAuth(),
                  ColumnSizedBox(15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenericText(
                        text: lblHaveAcct,
                        size: 12.sp,
                        weight: FontWeight.w400,
                        color: grey,
                      ),
                      RowSizedBox(5.w),
                      InkWell(
                        onTap: () => context.pushRoute(const LoginRoute()),
                        child: GenericText(
                          text: lblLogin,
                          size: 12.sp,
                          weight: FontWeight.w600,
                          color: blue,
                        ),
                      ),
                    ],
                  ),
                  ColumnSizedBox(15.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
