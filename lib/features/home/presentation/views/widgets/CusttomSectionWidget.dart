import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final VoidCallback onViewAllTap;
  final Widget child;

  const SectionWidget({
    super.key,
    required this.title,
    required this.onViewAllTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: onViewAllTap, child: const Text("View All"))
            ],
          ),
        ),
        child,
      ],
    );
  }
}
