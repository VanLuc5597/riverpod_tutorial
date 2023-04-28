import 'package:flutter/material.dart';

import 'input_area_error.dart';

class RePasswordInputError extends StatelessWidget {
  const RePasswordInputError({
    super.key,
    this.isError = false,
    this.isEmpty = false,
  });

  final bool isError;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    if (isEmpty) {
      return const InputAreaError(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        text: 'Required',
      );
    }
    if (isError) {
      return const InputAreaError(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        text: 'RePassword must same password',
      );
    }
    return const SizedBox.shrink();
  }
}
