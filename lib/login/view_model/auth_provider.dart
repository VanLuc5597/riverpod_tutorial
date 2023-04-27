import 'package:clone_riverpod_hooks/global/ultil/app_provider_container.dart';
import 'package:clone_riverpod_hooks/global/ultil/failure.dart';
import 'package:clone_riverpod_hooks/global/view/app_text_style.dart';
import 'package:clone_riverpod_hooks/login/data/model/email_login_param.dart';
import 'package:clone_riverpod_hooks/login/data/usecase/email_login_use_case.dart';
import 'package:clone_riverpod_hooks/login/view_model/login_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../global/ultil/app_colors.dart';
import '../../global/ultil/global_context_key.dart';
import '../../global/ultil/route_manager.dart';
import '../data/model/authentication_mode.dart';

class AuthProvider extends ChangeNotifier {
  final EmailLoginUseCase emailLoginUseCase;

  AuthProvider(this.emailLoginUseCase);

  AuthenticationMode mode = AuthenticationMode.auth;

  Future<void> emailLogIn() async {
    final login = AppProviderContainer.instance.read(loginProvider);
    if (login.isFormValid) {
      final emailLoginParam = EmailLoginParam(
          login.eMailTextEditingController.text,
          login.passwordTextEditingController.text);

      _logIn(() async {
        return await emailLoginUseCase(emailLoginParam);
      });
    }
  }

  Future<void> _logIn<T>(
    Future<Either<Failure, T>> Function() func,
  ) async {
    mode = AuthenticationMode.inProgress;
    notifyListeners();
    _showLoadingDialog();

    final resultEither = await func();

    RouteManager.back();
    resultEither.fold(
      (left) {
        _showSnackBar(left.message ?? 'Đã có lỗi xảy ra trong quá trình xử lý');
      },
      (right) {
        mode = AuthenticationMode.loggedIn;
        // RouteManager.pushReplacementNamed(AppRoutes.homePage);
        print('Login success');
      },
    );
  }

  Future<void> _showLoadingDialog() async {
    await showDialog(
      context: GlobalContextKey.instance.globalKey.currentContext!,
      barrierDismissible: false,
      builder: (final _) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }

  Future<void> _showSnackBar(String text) async {
    ScaffoldMessenger.of(GlobalContextKey.instance.globalKey.currentContext!)
        .showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.only(bottom: 64),
        backgroundColor: AppColors.transparentRed,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
          height: 60,
          width: 120,
          padding: const EdgeInsets.all(2),
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppTextStyle.poppins18SemiBold.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
