import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:square/features/entreprise/domain/entities/entreprise.dart';
import 'package:square/features/entreprise/presentation/bloc/entreprise_crud/entreprise_crud_bloc_bloc.dart';
import 'package:square/features/entreprise/presentation/widgets/add_update_form.dart';
import 'package:square/injection_container.dart';

class EntrepriseAddUpdate extends StatelessWidget {
  final Entreprise? entreprise;

  final bool iSupdate;

  const EntrepriseAddUpdate(
      {super.key, this.entreprise, required this.iSupdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(iSupdate ? "New Entreprise" : "Update Entreprise"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocProvider(
      create: (_) => sl<EntrepriseCrudBloc>(),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocConsumer<EntrepriseCrudBloc, EntrepriseCrudBlocState>(
                builder: (context, state) {
              if (state is LoadingEntrepriseCrudState) {
                debugPrint("LoadingEntrepriseCrudState");
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return FormWidget(
                  iSupdate: iSupdate, entreprise: iSupdate ? entreprise : null);
            }, listener: (context, state) {
              if (state is SuccessEntrepriseCrudState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  debugPrint("SuccessEntrepriseCrudState");
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Success"),
                  ));
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/entreprises", (route) => false);
                });
              } else if (state is ErrorEntrepriseCrudState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  debugPrint("ErrorEntrepriseCrudState");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                  ));
                });
              }
            })),
      ),
    );
  }
}
