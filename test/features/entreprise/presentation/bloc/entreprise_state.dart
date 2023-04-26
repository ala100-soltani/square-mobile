part of 'entreprise_bloc.dart';

abstract class EntrepriseState extends Equatable {
  const EntrepriseState();  

  @override
  List<Object> get props => [];
}
class EntrepriseInitial extends EntrepriseState {}
