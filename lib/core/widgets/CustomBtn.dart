import 'package:flutter/material.dart';

import '../AppColors.dart';


class Custombtn extends StatelessWidget {
  Custombtn({super.key, required this.Name, required this.onPressed});
  String Name = '';
  void Function()? onPressed;
  bool ispressed = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 343,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ispressed ? AppColors.primryColor : AppColors.secandryColor,
              shape: StadiumBorder(
                  side: BorderSide(
                color: AppColors.secandryColor,
              ))),
          onPressed: onPressed,
          child: Text(
            Name,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
