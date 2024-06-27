import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String hintText;
  IconData? icon;

  InputFieldWidget({
    super.key,
    required this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: icon == null
            ? InputDecoration(hintText: hintText)
            : InputDecoration(hintText: hintText, prefixIcon: Icon(icon)));
  }
}
