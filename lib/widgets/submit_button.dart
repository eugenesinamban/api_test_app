import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function validateInput;
  final TextEditingController textController;

  SubmitButton(this.validateInput, this.textController);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => validateInput(textController.text),
        tooltip: 'Show me the value!',
        child: Icon(
          Icons.text_fields,
        ),
      );
  }
}