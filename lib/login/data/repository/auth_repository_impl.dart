import 'package:clone_riverpod_hooks/global/ultil/failure.dart';
import 'package:clone_riverpod_hooks/global/ultil/network_info.dart';
import 'package:clone_riverpod_hooks/login/data/datasource/onboarding_local_data_source.dart';
import 'package:clone_riverpod_hooks/login/data/model/email_login_param.dart';
import 'package:clone_riverpod_hooks/login/data/model/user_credential.dart';
import 'package:clone_riverpod_hooks/login/data/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final OnboardingLocalDataSource onboardingLocalDataSource;

  AuthRepositoryImpl(this.networkInfo, this.onboardingLocalDataSource);

  @override
  Future<Either<Failure, UserCredential>> emailLogIn(
      EmailLoginParam params) async {
    return _errorHandler<UserCredential>(
      () async {
        final credential =
            await onboardingLocalDataSource.getUserCredential(params);
        return Right(credential);
      },
    );
  }

  Future<Either<Failure, T>> _errorHandler<T>(
    Future<Either<Failure, T>> Function() func,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NoInternetConnectionFailure());
    }
    try {
      return await func();
    } on WrongEmailOrPasswordFailure {
      return Left(WrongEmailOrPasswordFailure());
    } catch (e) {
      return Left(UnImplementedFailure());
    }
  }
}
