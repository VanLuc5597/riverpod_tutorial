
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgPicture extends StatelessWidget {
  const AppSvgPicture({
    super.key,
    required this.svg,
    this.percentage = .045,
    this.color,
  });

  final String svg;
  final double percentage;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 100,
      child: SvgPicture.asset(
        svg,
        color: color,
        fit: BoxFit.contain,
      ),
    );
  }
}
