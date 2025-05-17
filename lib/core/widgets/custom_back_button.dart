// lib/core/widgets/custom_back_button.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum BackButtonStyle { normal, circle }

class CustomBackButton extends StatelessWidget {
  /// Ruta a la que navegar al pulsar.
  final String route;

  /// Color del icono.
  final Color? color;

  /// Estilo: `normal` o `circle`.
  final BackButtonStyle style;

  /// Tamaño total del botón circular (width/height).
  final double size;

  const CustomBackButton({
    super.key,
    required this.route,
    this.color,
    this.style = BackButtonStyle.normal,
    this.size = 18.0, // antes 20 de radio → 40 de diámetro
  });

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      Icons.arrow_back,
      color: color ?? Theme.of(context).iconTheme.color,
      size: 20, // icono de 20dp para equilibrar
    );

    switch (style) {
      case BackButtonStyle.circle:
        // dentro de case circle:
        return InkWell(
          borderRadius: BorderRadius.circular(size / 2),
          onTap: () => context.go(route),
          child: Container(
            width: size,
            height: size,
            constraints: BoxConstraints.tight(
              Size(size, size),
            ), // fuerza exacto
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surface.withValues(alpha: .8),
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: icon,
          ),
        );

      case BackButtonStyle.normal:
        return IconButton(icon: icon, onPressed: () => context.go(route));
    }
  }
}
