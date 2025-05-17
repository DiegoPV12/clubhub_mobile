// lib/features/home/presentation/widgets/promo_card.dart
import 'package:flutter/material.dart';

/// Tarjeta individual del carrusel.
class PromoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final double borderRadius;
  final String imagePath; // unificado
  final double imageSize;
  final double height;
  final VoidCallback? onTap;

  const PromoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.imagePath,
    this.borderRadius = 16,
    this.imageSize = 40,
    this.height = 180,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            // Texto
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: cs.onPrimary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: cs.onPrimary.withValues(alpha: .9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Imagen esquina inferior derecha
            Positioned(
              bottom: 8,
              right: 8,
              child: Image.asset(
                imagePath,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
