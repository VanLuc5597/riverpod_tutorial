import 'package:clone_riverpod_hooks/global/view/email_input_error.dart';
import 'package:clone_riverpod_hooks/global/view/name_input_error.dart';
import 'package:clone_riverpod_hooks/global/view/password_input_error.dart';
import 'package:clone_riverpod_hooks/global/view/repassword_input_error.dart';
import 'package:clone_riverpod_hooks/login/view_model/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../global/view/app_text_style.dart';
import '../../global/view/custom_text_field.dart';
import '../../global/view/filled_long_button.dart';
import '../../global/view/header_text.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerViewModel = ref.watch(registerProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                HeaderText(
                    'Please fill all to register,'
                        ' thank you !!!',
                    100,
                    1,
                    AppTextStyle.title30BoldBlack),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomTextField(
                    hintText: 'Input your email',
                    controller: registerViewModel.eMailTextEditingController,
                    obscureText: false,
                    height: 60,
                  ),
                ),
                if (registerViewModel.onTriggerButtonRegister) ...[
                  EmailInputError(
                    isError: !registerViewModel.isPasswordValid,
                    isEmpty: registerViewModel
                        .passwordTextEditingController.text.isEmpty,
                  ),
                ],
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomTextField(
                    hintText: 'Input your name',
                    controller: registerViewModel.nameTextEditingController,
                    obscureText: false,
                    height: 60,
                  ),
                ),
                if (registerViewModel.onTriggerButtonRegister) ...[
                  NameInputError(
                    isError: !registerViewModel.isNamedValid,
                    isEmpty: registerViewModel
                        .nameTextEditingController.text.isEmpty,
                  ),
                ],
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomTextField(
                    hintText: 'Input your password',
                    controller: registerViewModel.passwordTextEditingController,
                    obscureText: false,
                    height: 60,
                  ),
                ),
                if (registerViewModel.onTriggerButtonRegister) ...[
                  PasswordInputError(
                    isError: !registerViewModel.isPasswordValid,
                    isEmpty: registerViewModel
                        .passwordTextEditingController.text.isEmpty,
                  ),
                ],
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomTextField(
                    hintText: 'Input your password again',
                    controller:
                    registerViewModel.rePasswordTextEditingController,
                    obscureText: false,
                    height: 60,
                  ),
                ),
                if (registerViewModel.onTriggerButtonRegister) ...[
                  RePasswordInputError(
                    isError: !registerViewModel.isRePasswordValid,
                    isEmpty: registerViewModel
                        .rePasswordTextEditingController.text.isEmpty,
                  ),
                ],
                const SizedBox(
                  height: 60,
                ),
                FilledLongButton(
                  onTap: () {
                    registerViewModel.setIsLoginButtonTriggeredTrue();
                  },
                  text: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

