import 'package:flutter/material.dart';

Future<String?> showTextInputDialog(
  BuildContext context, {
  required String title,
  String? initial,
  String hint = "",
}) async {
  final textFieldController = TextEditingController(text: initial);
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: textFieldController,
          decoration: InputDecoration(hintText: hint),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context, textFieldController.text),
          ),
        ],
      );
    },
  );
}
