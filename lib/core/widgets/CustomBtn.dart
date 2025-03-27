import 'package:flutter/material.dart';

import '../resources/AppColors.dart';


class Custombtn extends StatelessWidget {
  Custombtn({super.key, required this.Name, required this.onPressed});
  String Name = '';
  void Function()? onPressed;
  bool ispressed = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 370,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ispressed ? AppColors.primaryColor : AppColors.backgroundColor,
              shape: const StadiumBorder(
                  side: BorderSide(
                color: AppColors.grey,
              ))),
          onPressed: onPressed,
          child: Text(
            Name,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
