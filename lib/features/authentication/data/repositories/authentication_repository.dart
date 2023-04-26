import 'package:dartz/dartz.dart';
import 'package:square/core/error/exceptions.dart';
import 'package:square/core/error/failures.dart';
import 'package:square/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:square/features/authentication/domain/entities/login.dart';
import 'package:square/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Login>> loginUser(
      String email, String password) async {
    //if (await networkInfo.isConnected) {
    try {
      final remoteData = await remoteDataSource.loginUser(email, password);
      //localDataSource.cacheToken(remoteData);
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Login>> fetchCachedToken() {
    // TODO: implement fetchCachedToken
    throw UnimplementedError();
/*  try {
      final localData = await localDataSource.getLastToken();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    } */
  }
}
