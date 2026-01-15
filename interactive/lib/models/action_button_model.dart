import 'package:flutter/material.dart';

class ActionButtonModel {
  final String label;
  final IconData icon;
  final Color color;
  final String description;
  final VoidCallback onTap;

  ActionButtonModel({
    required this.label,
    required this.icon,
    required this.color,
    required this.description,
    required this.onTap,
  });
}