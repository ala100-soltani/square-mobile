import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final bool isupdate;
  final void Function() onpressed;

  const FormSubmitBtn(
      {super.key, required this.isupdate, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onpressed,
        icon: isupdate ? const Icon(Icons.edit) : const Icon(Icons.add),
        label: isupdate ? const Text("update ") : const Text("add"));
  }
}
