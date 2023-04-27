import 'package:clone_riverpod_hooks/global/view/app_text_style.dart';
import 'package:clone_riverpod_hooks/global/view/custom_text_field.dart';
import 'package:clone_riverpod_hooks/global/view/email_input_error.dart';
import 'package:clone_riverpod_hooks/global/view/filled_long_button.dart';
import 'package:clone_riverpod_hooks/global/view/header_text.dart';
import 'package:clone_riverpod_hooks/global/view/password_input_error.dart';
import 'package:clone_riverpod_hooks/global/view/text_and_click_able_text.dart';
import 'package:clone_riverpod_hooks/login/view/widgets/forgot_password.dart';
import 'package:clone_riverpod_hooks/login/view_model/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                HeaderText('Hello, welcome back...', 40, 1,
                    AppTextStyle.title30BoldBlack),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomTextField(
                    hintText: 'Input your email',
                    controller: login.eMailTextEditingController,
                    obscureText: false,
                    height: 60,
                  ),
                ),
                if (login.isButtonLoginClick) ...[
                  EmailInputError(
                    isError: !login.isEmailValid,
                    isEmpty: login.eMailTextEditingController.text.isEmpty,
                  ),
                ],
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomTextField(
                    hintText: 'Input your password',
                    controller: login.passwordTextEditingController,
                    obscureText: false,
                    height: 60,
                  ),
                ),
                if (login.isButtonLoginClick) ...[
                  PasswordInputError(
                    isError: !login.isPasswordValid,
                    isEmpty: login.passwordTextEditingController.text.isEmpty,
                  ),
                ],
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: ForgotPassword(),
                ),
                const SizedBox(
                  height: 40,
                ),
                FilledLongButton(
                  onTap: () {
                    onClickButtonLogin(login, context);
                  },
                  text: 'Login',
                ),
                const SizedBox(
                  height: 60,
                ),
                TextAndAbleClickText(
                  onTap: () {},
                  text1: "Don't have account?",
                  text2: "Register now",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onClickButtonLogin(LoginProvider loginProvider, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Sending Message"),
    ));
    loginProvider.setIsLoginButtonTriggeredTrue();
  }
}
