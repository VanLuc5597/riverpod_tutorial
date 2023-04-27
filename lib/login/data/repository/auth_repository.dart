import 'package:clone_riverpod_hooks/login/data/model/email_login_param.dart';
import 'package:dartz/dartz.dart';

import '../../../global/ultil/failure.dart';
import '../model/user_credential.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> emailLogIn(EmailLoginParam params);
}
