import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final bool multiline;

  final String name;

  final TextEditingController controller;

  const TextFormFieldWidget(
      {super.key,
      required this.name,
      required this.multiline,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextFormField(
          maxLines: multiline ? 6 : 1,
          minLines: multiline ? 6 : 1,
          controller: controller,
          validator: (val) => val!.isEmpty ? "$name cant be empty" : null,
        ));
  }
}
