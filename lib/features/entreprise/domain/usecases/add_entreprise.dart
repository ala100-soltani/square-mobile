import 'package:dartz/dartz.dart';
import 'package:square/core/error/failures.dart';
import 'package:square/features/entreprise/domain/entities/entreprise.dart';
import 'package:square/features/entreprise/domain/repositories/entreprise_repository.dart';

class AddEntrepriseUseCase {
  final EntrepriseRepository repository;

  AddEntrepriseUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Entreprise entreprise) async {
    return await repository.addEntreprise(entreprise);
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////