import 'package:clone_riverpod_hooks/global/ultil/app_colors.dart';
import 'package:clone_riverpod_hooks/global/view/app_text_style.dart';
import 'package:flutter/cupertino.dart';

class ForgotPassword extends StatelessWidget{
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
         "Forgot password",
          style: AppTextStyle.inter14Regular.copyWith(
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}