import 'package:dartz/dartz.dart';
import 'package:square/core/error/failures.dart';
import 'package:square/features/entreprise/domain/entities/entreprise.dart';
import 'package:square/features/entreprise/domain/repositories/entreprise_repository.dart';

class GetAllEntrepriseUserCase {
  final EntrepriseRepository repository;

  GetAllEntrepriseUserCase(this.repository);

  Future<Either<Failure, List<Entreprise>>> call() async {
    return await repository.getAllEntreprises();
  }
}
