import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:square/features/entreprise/domain/entities/entreprise.dart';
import 'package:square/features/entreprise/domain/usecases/get_all_entreprise.dart';

part 'entreprise_event.dart';
part 'entreprise_state.dart';

class EntrepriseBloc extends Bloc<EntrepriseEvent, EntrepriseState> {
  final GetAllEntrepriseUserCase getAllEntrepriseUserCase;
  EntrepriseBloc(this.getAllEntrepriseUserCase) : super(EntrepriseInitial()) {
    on<EntrepriseEvent>((event, emit) async {
      if (event is GetAllEntrepriseEvent) {
        emit(LoadingEntrepriseState());
        await getAllEntrepriseUserCase().then((value) {
          value.fold((l) => emit(ErrorEntrepriseState(message: l.toString())),
              (r) {
            emit(LoadedEntrepriseState(entreprises: r));
          });
        });
      } else if (event is RefreshEntrepriseEvents) {
        emit(LoadingEntrepriseState());
        await getAllEntrepriseUserCase().then((value) {
          value.fold((l) => emit(ErrorEntrepriseState(message: l.toString())),
              (r) {
            emit(LoadedEntrepriseState(entreprises: r));
          });
        });
      } else if (event is RefreshEntrepriseEvents) {
        emit(LoadingEntrepriseState());
        await getAllEntrepriseUserCase().then((value) {
          value.fold((l) => emit(ErrorEntrepriseState(message: l.toString())),
              (r) {
            emit(LoadedEntrepriseState(entreprises: r));
          });
        });
      }
    });
  }
}
