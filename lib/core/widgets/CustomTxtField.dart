import 'package:flutter/material.dart';

import '../AppColors.dart';


class CustomTxtField extends StatelessWidget {

  String LabelName = '';

  Widget? suffix;
  TextEditingController controller;
  String? Function(String?)? validator;
   Function(String)? onchanged;
  CustomTxtField(
      {required this.LabelName,
      required this.controller,
      required this.onchanged,
      required this.validator,
      this.suffix}
      );


  @override
  Widget build(BuildContext context) {
    return TextFormField(

          obscuringCharacter: '★',
          validator: validator,
          onChanged: onchanged,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secandryColor)),
            label: Text(LabelName),
            suffix: suffix,
          )
    );
  }
}
