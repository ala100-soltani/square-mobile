import 'package:dartz/dartz.dart';
import 'package:square/core/error/failures.dart';
import 'package:square/features/entreprise/domain/entities/entreprise.dart';

abstract class EntrepriseRepository {
  Future<Either<Failure, List<Entreprise>>> getAllEntreprises();
  Future<Either<Failure, Unit>> addEntreprise(Entreprise entreprise);
}
