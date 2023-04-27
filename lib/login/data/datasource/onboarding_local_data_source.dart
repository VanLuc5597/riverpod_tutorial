import 'dart:convert';

import 'package:clone_riverpod_hooks/global/ultil/failure.dart';
import 'package:clone_riverpod_hooks/login/data/model/email_login_param.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_credential_model.dart';

abstract class OnboardingLocalDataSource {
  Future<UserCredentialModel> getUserCredential(
      EmailLoginParam emailLoginParam);
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  OnboardingLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<UserCredentialModel> getUserCredential(
      EmailLoginParam emailLoginParam) async {
    final json = sharedPreferences.getString(emailLoginParam.email);
    if (json != null) {
      final credential = UserCredentialModel.fromJson(jsonDecode(json));
      if (credential.password == emailLoginParam.password) {
        return credential;
      }
    }
    throw WrongEmailOrPasswordFailure();
  }
}
