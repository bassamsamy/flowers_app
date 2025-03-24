import 'package:flowers_app/core/AppColors.dart';
import 'package:flutter/material.dart';



class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.secandryColor
      ),
    );
  }
}
