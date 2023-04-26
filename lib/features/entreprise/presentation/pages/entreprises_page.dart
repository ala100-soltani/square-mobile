import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:square/features/entreprise/presentation/bloc/entreprise_bloc.dart';
import 'package:square/features/entreprise/presentation/pages/entreprise_add_update_page.dart';
import 'package:square/injection_container.dart';

class EntreprisesPage extends StatelessWidget {
  const EntreprisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entreprises'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const EntrepriseAddUpdate(iSupdate: false))),
        },
        child: const Icon(Icons.add),
      ),
      body: _buildBody(context),
    );
  }

  BlocProvider<EntrepriseBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EntrepriseBloc>()..add(GetAllEntrepriseEvent()),
      child: BlocBuilder<EntrepriseBloc, EntrepriseState>(
        builder: (context, state) {
          if (state is LoadingEntrepriseState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedEntrepriseState) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: ListView.builder(
                itemCount: state.entreprises.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.entreprises[index].name),
                    subtitle:
                        Text(state.entreprises[index].description, maxLines: 3),
                    onTap: () => {},
                  );
                },
              ),
            );
          } else if (state is ErrorEntrepriseState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<EntrepriseBloc>(context).add(RefreshEntrepriseEvents());
  }
}
