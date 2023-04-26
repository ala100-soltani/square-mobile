import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:square/core/error/failures.dart';
import 'package:square/core/usecases/usecase.dart';
import 'package:square/features/authentication/domain/entities/login.dart';

import '../repositories/authentication_repository.dart';

class LoginUser implements UseCase<Login, LoginParams> {
  final AuthenticationRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, Login>> call(LoginParams params) async {
    return await repository.loginUser(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password}) : super();

  @override
  List<Object?> get props => [email, password];
}
