import 'package:clone_riverpod_hooks/global/view/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ultil/app_colors.dart';

class FilledLongButton extends StatelessWidget {
  const FilledLongButton({
    required this.onTap,
    required this.text,
    this.color,
    super.key,
  });

  final void Function() onTap;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColors.darkPurple,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        alignment: Alignment.center,
        height: 50,
        child: Text(
          text,
          style: AppTextStyle.poppins16Medium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}