import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../global/ultil/validators.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController eMailTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController rePasswordTextEditingController =
      TextEditingController();

  bool onTriggerButtonRegister = false;

  void setIsLoginButtonTriggeredTrue() {
    onTriggerButtonRegister = true;
    notifyListeners();
  }

  bool get isEmailValid {
    return Validators.isEmailValid(eMailTextEditingController.text);
  }

  bool get isPasswordValid {
    return Validators.isPasswordValid(passwordTextEditingController.text);
  }

  bool get isRePasswordValid {
    return (rePasswordTextEditingController.text ==
        passwordTextEditingController.text);
  }

  bool get isNamedValid {
    return (nameTextEditingController.text.length > 5);
  }

  bool get isFormValid {
    return (isEmailValid &&
        isPasswordValid &&
        isRePasswordValid &&
        isNamedValid);
  }
}

final registerProvider = ChangeNotifierProvider((ref) => RegisterProvider());
