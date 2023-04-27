import 'package:clone_riverpod_hooks/global/ultil/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController eMailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  bool isButtonLoginClick = false;
  bool isPasswordObscured = true;
  bool isEmailObscured = true;

  void setIsLoginButtonTriggeredTrue() {
    isButtonLoginClick = true;
    notifyListeners();
  }

  void passwordObscuredToggle() {
    isPasswordObscured = !isPasswordObscured;
    notifyListeners();
  }

  bool get isEmailValid {
    return Validators.isEmailValid(eMailTextEditingController.text);
  }

  bool get isPasswordValid {
    return Validators.isPasswordValid(passwordTextEditingController.text);
  }

  bool get isFormValid {
    return (isEmailValid && isPasswordValid);
  }
}

final loginProvider = ChangeNotifierProvider((ref) => LoginProvider());
