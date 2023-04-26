part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class NotLoggedState extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class LoggedState extends AuthenticationState {
  final Login login;

  const LoggedState({required this.login});

  @override
  List<Object> get props => [login];
}

class ErrorState extends AuthenticationState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
