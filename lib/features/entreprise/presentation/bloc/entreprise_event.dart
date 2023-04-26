part of 'entreprise_bloc.dart';

abstract class EntrepriseEvent extends Equatable {
  const EntrepriseEvent();

  @override
  List<Object> get props => [];
}

class GetAllEntrepriseEvent extends EntrepriseEvent {}

class RefreshEntrepriseEvents extends EntrepriseEvent {}
