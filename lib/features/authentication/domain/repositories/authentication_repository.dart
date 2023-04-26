import 'package:dartz/dartz.dart';
import 'package:square/core/error/failures.dart';
import 'package:square/features/authentication/domain/entities/login.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, Login>> loginUser(String email, String password);
  Future<Either<Failure, Login>> fetchCachedToken();
}
