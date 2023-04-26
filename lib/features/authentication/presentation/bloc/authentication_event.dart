part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CheckLoginStatusEvent extends AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);
}

class SkipLoginEvent extends AuthenticationEvent {}
