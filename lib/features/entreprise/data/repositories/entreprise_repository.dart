import 'package:dartz/dartz.dart';
import 'package:square/core/error/exceptions.dart';
import 'package:square/core/error/failures.dart';

import 'package:square/features/entreprise/data/datasources/entreprise_remote_source.dart';
import 'package:square/features/entreprise/data/models/entreprise_model.dart';
import 'package:square/features/entreprise/domain/entities/entreprise.dart';
import 'package:square/features/entreprise/domain/repositories/entreprise_repository.dart';

class EntrepriseRepositoryImpl implements EntrepriseRepository {
  final EntrepriseRemoteDataSource remoteDataSource;

  EntrepriseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Unit>> addEntreprise(Entreprise entreprise) async {
    try {
      final EntrepriseModel entrepriseModel = EntrepriseModel(
          name: entreprise.name,
          description: entreprise.description,
          address: entreprise.address,
          phone: entreprise.phone,
          email: entreprise.email);
      final remoteData = await remoteDataSource.addEntreprise(entrepriseModel);
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Entreprise>>> getAllEntreprises() async {
    try {
      final remotepost = await remoteDataSource.getAllEntreprises();
      return Right(remotepost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
