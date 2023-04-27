import 'package:clone_riverpod_hooks/global/ultil/app_colors.dart';
import 'package:clone_riverpod_hooks/global/view/app_text_style.dart';
import 'package:flutter/material.dart';

class TextAndAbleClickText extends StatelessWidget {
  const TextAndAbleClickText({
    super.key,
    this.style,
    this.onTap,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;
  final TextStyle? style;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text1,
          style: AppTextStyle.inter14Regular.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: AppTextStyle.inter14Regular.copyWith(
              color: AppColors.green,
            ),
          ),
        ),
      ],
    );
  }
}
