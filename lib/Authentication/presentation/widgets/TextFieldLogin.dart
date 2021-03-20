import 'package:authentication_sample/core/Validator/string_validators.dart';
import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final String name;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final bool validation;
  final String errorText;
  final TextEditingController textEditingController;
  final int maxText;

  TextFieldLogin.userName({
    this.name = 'User Name',
    this.obscureText = false,
    this.maxText = 60,
    @required this.validation,
    @required this.onChanged,
    @required this.errorText,
    @required this.textEditingController,
  });

  TextFieldLogin.password({
    this.name = 'Password',
    this.obscureText = true,
    this.maxText = 60,
    @required this.validation,
    @required this.onChanged,
    @required this.errorText,
    @required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        inputFormatters: [
          ValidatorInputFormatter(
            editingValidator: MaxLengthStringValidator(maxText),
          ),
        ],
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorText: validation ? null : errorText,
          border: OutlineInputBorder(),
          labelText: name,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
