import 'package:flutter/material.dart';
import '../style.dart';

class CountryNameField extends StatelessWidget {
  final TextEditingController _textController;

  CountryNameField(this._textController);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: FormPadding,
      child: TextFormField(
        controller: _textController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Country Name',
        ),
        onSaved: (String value) {
          
        },
        validator: (String value) {
          if (value.isEmpty) {
            return 'Field must be complete!';
          }
          return null;
        },
      ),
    );
  }
}
