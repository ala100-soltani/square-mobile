part of 'entreprise_bloc.dart';

abstract class EntrepriseState extends Equatable {
  const EntrepriseState();

  @override
  List<Object> get props => [];
}

class EntrepriseInitial extends EntrepriseState {}

class LoadingEntrepriseState extends EntrepriseState {}

class LoadedEntrepriseState extends EntrepriseState {
  final List<Entreprise> entreprises;
  const LoadedEntrepriseState({required this.entreprises});
  @override
  List<Object> get props => [entreprises];
}

class ErrorEntrepriseState extends EntrepriseState {
  final String message;

  const ErrorEntrepriseState({required this.message});

  @override
  List<Object> get props => [message];
}
