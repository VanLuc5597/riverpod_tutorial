import 'package:flutter/cupertino.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double? height;
  final double? leftPadding;
  final TextStyle? style;

  const HeaderText(this.text, this.height, this.leftPadding, this.style,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: leftPadding ?? 0),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
