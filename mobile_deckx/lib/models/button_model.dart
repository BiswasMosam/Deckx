import 'package:flutter/material.dart';

class ButtonModel {
  final String name;
  final String action;
  final Color color;
  final String iconPath;
  final List<String> multiActions;

  ButtonModel({
    required this.name,
    required this.action,
    this.color = Colors.teal,
    this.iconPath = '',
    this.multiActions = const [],
  });
}