part of 'entreprise_crud_bloc_bloc.dart';

abstract class EntrepriseCrudBlocEvent extends Equatable {
  const EntrepriseCrudBlocEvent();

  @override
  List<Object> get props => [];
}

class CreateEntrepriseEvent extends EntrepriseCrudBlocEvent {
  final Entreprise entreprise;

  const CreateEntrepriseEvent({required this.entreprise});

  @override
  List<Object> get props => [entreprise];
}

class UpdateEntrepriseEvent extends EntrepriseCrudBlocEvent {
  final Entreprise entreprise;

  const UpdateEntrepriseEvent({required this.entreprise});

  @override
  List<Object> get props => [entreprise];
}

class DeleteEntrepriseEvent extends EntrepriseCrudBlocEvent {
  final Entreprise entreprise;

  const DeleteEntrepriseEvent({required this.entreprise});

  @override
  List<Object> get props => [entreprise];
}
