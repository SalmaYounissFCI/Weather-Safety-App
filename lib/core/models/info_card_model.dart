import 'dart:ui';

import 'package:flutter/material.dart';

class InfoCardModel {
  // الخصائص الأربعة الأساسية التي تأتي من الخدمة
  final String title;
  final String message;
  final IconData icon;
  final Color color;

  final VoidCallback? onTap;
  final bool showArrow;

  InfoCardModel({
    required this.title,
    required this.message,
    required this.icon,
    required this.color,
    this.onTap,
    this.showArrow = true,
  });
}
