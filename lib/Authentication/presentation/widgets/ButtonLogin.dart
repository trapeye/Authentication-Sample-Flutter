import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  ButtonLogin({
    @required this.name,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          name,
        ),
      ),
    );
  }
}
