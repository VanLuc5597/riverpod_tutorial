import 'package:clone_riverpod_hooks/global/ultil/failure.dart';
import 'package:clone_riverpod_hooks/global/ultil/use_case.dart';
import 'package:clone_riverpod_hooks/login/data/model/email_login_param.dart';
import 'package:clone_riverpod_hooks/login/data/model/user_credential.dart';
import 'package:dartz/dartz.dart';

class EmailLoginUseCase implements UseCase<UserCredential, EmailLoginParam>{
  @override
  Future<Either<Failure, UserCredential>> call(EmailLoginParam params) {
    throw UnimplementedError();
  }

}