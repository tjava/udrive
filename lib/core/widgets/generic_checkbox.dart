import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/constants/colors_constant.dart';

class GenericCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color activeColor;
  final Color checkColor;
  final double borderRadius;

  const GenericCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = blue,
    this.checkColor = white,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: value ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: value ? activeColor : inputGrey,
          ),
        ),
        height: 16.h,
        width: 18.w,
        child: value
            ? Icon(
                Icons.check,
                color: checkColor,
                size: 15.sp,
              )
            : null,
      ),
    );
  }
}
