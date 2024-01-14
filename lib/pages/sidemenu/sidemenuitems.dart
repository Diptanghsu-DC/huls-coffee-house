import 'package:flutter/material.dart';

class SideMenuItem {
  final String title;
  final IconData iconPath1;
  final VoidCallback onTap;

  SideMenuItem({
    required this.title,
    required this.iconPath1,
    required this.onTap,
  });
}
