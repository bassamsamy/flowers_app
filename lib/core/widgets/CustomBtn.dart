import 'package:flutter/material.dart';

import '../resources/AppColors.dart';

class Custombtn extends StatelessWidget {
  const Custombtn({super.key, required this.name, required this.onPressed});
  final String name;
  final void Function()? onPressed;
  final bool ispressed = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 370,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              ispressed ? AppColors.primaryColor : AppColors.backgroundColor,
          disabledBackgroundColor: AppColors.darkGrey,
          shape: const StadiumBorder(
            side: BorderSide(
              color: AppColors.grey,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
