// lib/features/home/presentation/widgets/promo.dart
import 'package:flutter/material.dart';

/// Modelo de datos para cada banner promocional.
class Promo {
  final String title;
  final String subtitle;
  final Color color;
  final String imagePath;

  const Promo({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.imagePath,
  });
}
