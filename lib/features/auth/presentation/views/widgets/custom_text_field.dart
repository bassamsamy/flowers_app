import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.validator,
      this.hintText,
      this.labelText,
      this.obscureText = false});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;

  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: theme.textTheme.bodySmall,
        hintText: hintText,
        hintStyle: theme.textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFF1D1B20),
          ),
        ),
      ),
    );
  }
}
