import 'package:flutter/material.dart';

import '../resources/AppColors.dart';

class Custombtn extends StatelessWidget {
  Custombtn(
      {super.key,
      required this.Name,
      required this.onPressed,
      this.width = 370});
  String Name = '';
  double width;
  void Function()? onPressed;
  bool ispressed = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ispressed
                  ? AppColors.primaryColor
                  : AppColors.backgroundColor,
              disabledBackgroundColor: AppColors.darkGrey,
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
