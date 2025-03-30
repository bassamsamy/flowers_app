import 'package:flutter/material.dart';
import '../../../../../core/resources/AppColors.dart';

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

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  const CustomElevatedButton({
    super.key,
    this.prefixIcon,
    this.textStyle,
    this.isStadiumBorder = true,
    this.backgroundColor,
    this.borderColor,
    this.radius,
    this.suffixIcon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: isStadiumBorder
              ? StadiumBorder(
                  side: BorderSide(
                  color: borderColor ?? AppColors.doneColor,
                ))
              : RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          backgroundColor: backgroundColor ?? AppColors.doneColor,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            const SizedBox(
              width: 24,
            ),
            Text(
              label,
              style: textStyle ?? const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 27,
            ),
            suffixIcon ?? const SizedBox()
          ],
        ));
  }
}
