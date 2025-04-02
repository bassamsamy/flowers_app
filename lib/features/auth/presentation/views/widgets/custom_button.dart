import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      required this.backgroundColor,
      this.textColor = Colors.white,
      this.borderColor = Colors.transparent});

  final void Function()? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: borderColor, width: 1),
                  borderRadius: BorderRadius.circular(100))),
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
          )),
    );
  }
}
