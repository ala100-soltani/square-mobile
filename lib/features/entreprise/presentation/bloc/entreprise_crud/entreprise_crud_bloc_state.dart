part of 'entreprise_crud_bloc_bloc.dart';

abstract class EntrepriseCrudBlocState extends Equatable {
  const EntrepriseCrudBlocState();

  @override
  List<Object> get props => [];
}

class EntrepriseCrudBlocInitial extends EntrepriseCrudBlocState {}

class LoadingEntrepriseCrudState extends EntrepriseCrudBlocState {}

class ErrorEntrepriseCrudState extends EntrepriseCrudBlocState {
  final String message;

  const ErrorEntrepriseCrudState(this.message);

  @override
  List<Object> get props => [message];
}

class SuccessEntrepriseCrudState extends EntrepriseCrudBlocState {
  final String message;

  const SuccessEntrepriseCrudState(this.message);

  @override
  List<Object> get props => [message];
}
