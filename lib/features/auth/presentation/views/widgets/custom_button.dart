import 'package:flutter/material.dart';

import '../../../../../core/resources/AppColors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, required this.text, required this.color});

  final void Function()? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))),
          child: Text(
            text,
            style: theme.textTheme.bodyMedium,
          )),
    );
  }
}
