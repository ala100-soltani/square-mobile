import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'entreprise_event.dart';
part 'entreprise_state.dart';

class EntrepriseBloc extends Bloc<EntrepriseEvent, EntrepriseState> {
  EntrepriseBloc() : super(EntrepriseInitial()) {
    on<EntrepriseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
