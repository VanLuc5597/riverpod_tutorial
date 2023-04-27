
import 'package:flutter/material.dart';

import '../ultil/app_icons_paths.dart';
import 'app_svg_picture.dart';
import 'app_text_style.dart';

class InputAreaError extends StatelessWidget {
  const InputAreaError({
    super.key,
    this.padding = EdgeInsets.zero,
    this.error = true,
    this.space = 5,
    this.iconSizePercentage,
    this.text = "",
  });

  final EdgeInsetsGeometry padding;
  final bool error;
  final String text;
  final double? space;
  final double? iconSizePercentage;

  @override
  Widget build(BuildContext context) {
    if (!error) return const SizedBox.shrink();
    return Padding(
      padding: padding,
      child: Row(
        children: [
          SizedBox(width: space),
          Text(
            text,
            style: AppTextStyle.poppins12SemiBold.copyWith(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
