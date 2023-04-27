import 'package:clone_riverpod_hooks/global/ultil/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final Color? color;
  final bool obscureText;
  final Widget? suffix;
  final double? height;


  const CustomTextField({required this.hintText, this.onChanged, this.controller,
      this.hintStyle, this.color, required this.obscureText, this.suffix, this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        shadowColor: AppColors.primaryShadowColor,
        elevation: 6,
        color: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: AppColors.lightGrey2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextFormField(
              cursorColor: Colors.black,
              obscureText: obscureText,
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                suffix: suffix,
                hintStyle: hintStyle,
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

}