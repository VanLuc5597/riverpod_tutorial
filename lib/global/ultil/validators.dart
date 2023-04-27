class Validators {
  static const String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  //example password Aa0#888?
  static const String password = r'^(?=.*?[0-9]).{8,}$';

  static bool isEmailValid(String? value) {
    if (value != null && value.isNotEmpty) {
      if (RegExp(email).hasMatch(value)) return true;
    }
    return false;
  }

  static bool isPasswordValid(String? value) {
    if (value != null && value.isNotEmpty) {
      if (RegExp(password).hasMatch(value)) return true;
    }
    return false;
  }
}
