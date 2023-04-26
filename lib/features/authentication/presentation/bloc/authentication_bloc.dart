import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/login.dart';
import '../../domain/usecases/login_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUser loginUser;

  AuthenticationBloc(this.loginUser) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoadingState());
        final result = await loginUser(
            LoginParams(email: event.email, password: event.password));
        result.fold((l) => emit(ErrorState(message: l.toString())), (r) {
          emit(LoggedState(login: r));
        });
      } else if (event is SkipLoginEvent) {
        emit(NotLoggedState());
      }
    });
  }
}
