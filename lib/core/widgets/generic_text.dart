import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final String? fontFamily;

  const GenericText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.overflow,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16.sp,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal,
        fontFamily: fontFamily,
      ),
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
