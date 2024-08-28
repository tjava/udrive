import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/core/utils/snack_bar.dart';
import 'package:udrive/core/widgets/column_sized_box.dart';
import 'package:udrive/core/widgets/generic_button.dart';
import 'package:udrive/core/widgets/generic_checkbox.dart';
import 'package:udrive/core/widgets/generic_text.dart';
import 'package:udrive/core/widgets/generic_text_form_field.dart';
import 'package:udrive/core/widgets/row_sized_box.dart';
import 'package:udrive/features/auth/auth_constants.dart';
import 'package:udrive/features/auth/domain/entities/login_payload_entity.dart';
import 'package:udrive/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:udrive/features/auth/presentation/widgets/social_auth.dart';
import 'package:udrive/locator/locate.dart';
import 'package:udrive/navigator/router.gr.dart';

class LoginButtom extends StatefulWidget {
  const LoginButtom({super.key});

  @override
  State<LoginButtom> createState() => _LoginButtomState();
}

class _LoginButtomState extends State<LoginButtom> {
  late final LoginCubit _loginCubit;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late final FocusScopeNode _focusNode;

  bool _obscure = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();

    _loginCubit = locate<LoginCubit>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _loginCubit.close();

    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>.value(
      value: _loginCubit,
      child: BlocConsumer<LoginCubit, LoginState>(
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
            context.router.replaceAll([LayoutRoute(userEntity: state.userEntity!)]);
          }
        },
        builder: (context, state) {
          return Container(
            height: 330.h,
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
                            ColumnSizedBox(10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GenericCheckbox(
                                      value: _rememberMe,
                                      onChanged: (newValue) {
                                        _rememberMe = newValue!;
                                        setState(() {});
                                      },
                                    ),
                                    RowSizedBox(8.w),
                                    GenericText(
                                      text: lblRemember,
                                      size: 12.sp,
                                      color: grey,
                                      weight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                GenericText(
                                  text: lblForgotPass,
                                  size: 12.sp,
                                  color: grey,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                            ColumnSizedBox(15.h),
                            GenericButton(
                              label: lblLogin,
                              labelColor: white,
                              width: MediaQuery.of(context).size.width,
                              isBusy: state is Loaded ? true : false,
                              onClick: () async {
                                if (_formKey.currentState?.validate() ?? false) {
                                  _focusNode.unfocus();
                                  _loginCubit.login(LoginPayloadEntity(
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
                        text: lblNew,
                        size: 12.sp,
                        weight: FontWeight.w400,
                        color: grey,
                      ),
                      RowSizedBox(5.w),
                      InkWell(
                        onTap: () => context.pushRoute(const RegisterRoute()),
                        child: GenericText(
                          text: lblCreate,
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
