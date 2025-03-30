import 'package:flutter/material.dart';

import '../resources/AppColors.dart';

class CustomTxtField extends StatelessWidget {
  String LabelName = '';
  bool  isSecured=false;
  Widget? suffix;
  TextEditingController controller;
  String? Function(String?)? validator;
  Function(String)? onchanged;

  CustomTxtField(
      {required this.LabelName,
      required this.controller,
      required this.onchanged,
      required this.validator,
      this.isSecured=false,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscuringCharacter: '★',
        obscureText: isSecured,
        validator: validator,
        onChanged: onchanged,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey)),
          label: Text(LabelName),
          suffix: suffix,
        ));
  }
}
