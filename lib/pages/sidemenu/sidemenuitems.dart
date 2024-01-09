import 'package:flutter/material.dart';

class SideMenuItem {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  SideMenuItem({
    required this.title,
    required this.iconPath,
    required this.onTap,
  });
}
