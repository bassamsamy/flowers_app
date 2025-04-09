import 'package:flutter/material.dart';

class CustomTapBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs;
  final void Function(int)? onTap;

  CustomTapBar({required this.tabs, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs.map((e) => Tab(text: e)).toList(),
      dividerColor: Colors.transparent,
      isScrollable: true,
      onTap: onTap,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
