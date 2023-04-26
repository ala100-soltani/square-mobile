import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:square/features/entreprise/domain/entities/entreprise.dart';
import 'package:square/features/entreprise/domain/usecases/add_entreprise.dart';

part 'entreprise_crud_bloc_event.dart';
part 'entreprise_crud_bloc_state.dart';

class EntrepriseCrudBloc
    extends Bloc<EntrepriseCrudBlocEvent, EntrepriseCrudBlocState> {
  final AddEntrepriseUseCase addEntrepriseUseCase;

  EntrepriseCrudBloc({required this.addEntrepriseUseCase})
      : super(EntrepriseCrudBlocInitial()) {
    on<EntrepriseCrudBlocEvent>((event, emit) async {
      if (event is CreateEntrepriseEvent) {
        await addEntrepriseUseCase(event.entreprise);
        debugPrint("EntrepriseCrudBloc: CreateEntrepriseEvent");
      } else if (event is UpdateEntrepriseEvent) {
      } else if (event is DeleteEntrepriseEvent) {}
    });
  }
}
