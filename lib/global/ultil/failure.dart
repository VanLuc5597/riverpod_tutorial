import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  abstract final String? message;
}

// General failures
class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String? get message => null;
}

class NoInternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String? get message => 'No Internet Connection';
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String? get message => null;
}

class UnImplementedFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String? get message => null;
}

class WrongEmailOrPasswordFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String? get message => 'Wrong Password or Email';
}
