import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.validator,
      this.hintText,
      this.labelText});

  final TextEditingController controller;
  String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
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

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Widget? widget;
  const CustomTextFormField(
      {super.key,
      required this.label,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      required this.controller,
      this.validator,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 14, top: 14),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: widget,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
