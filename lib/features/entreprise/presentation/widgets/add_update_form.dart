import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:square/features/entreprise/domain/entities/entreprise.dart';
import 'package:square/features/entreprise/presentation/bloc/entreprise_crud/entreprise_crud_bloc_bloc.dart';
import 'package:square/features/entreprise/presentation/widgets/form_submit_button.dart';

class FormWidget extends StatefulWidget {
  final bool iSupdate;
  final Entreprise? entreprise;

  const FormWidget({super.key, required this.iSupdate, this.entreprise});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    if (widget.iSupdate) {
      //TODO : fill the form with the data of the entreprise if it is an update
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Name",
              hintText: "Entreprise Name",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a name";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Entreprise Email",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a email";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: "Phone",
              hintText: "Entreprise Phone",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a phone";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: "Description",
              hintText: "Entreprise Description",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a description";
              } else if (value.length < 10) {
                return "Description must be at least 10 characters";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(
              labelText: "Address",
              hintText: "Entreprise Address",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a address";
              }
              return null;
            },
          ),
          FormSubmitBtn(
              isupdate: widget.iSupdate, onpressed: validateFormThenUpdateOrAdd)
        ],
      ),
    );
  }

  void validateFormThenUpdateOrAdd() {
    final validate = _formKey.currentState!.validate();

    final entreprise = Entreprise(
        id: widget.iSupdate ? widget.entreprise!.id : null,
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        description: _descriptionController.text,
        address: _addressController.text);

    if (validate) {
      if (widget.iSupdate) {
        BlocProvider.of<EntrepriseCrudBloc>(context)
            .add(UpdateEntrepriseEvent(entreprise: entreprise));
      } else {
        BlocProvider.of<EntrepriseCrudBloc>(context)
            .add(CreateEntrepriseEvent(entreprise: entreprise));
      }
    }
  }
}
