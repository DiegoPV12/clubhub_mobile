// lib/features/home/presentation/widgets/promotional_carousel.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'promo_card.dart';
import 'promo.dart';

/// Carrusel que itera automáticamente sobre [promos].
class PromotionalCarousel extends StatefulWidget {
  final List<Promo> promos;

  const PromotionalCarousel({super.key, required this.promos});

  @override
  State<PromotionalCarousel> createState() => _PromotionalCarouselState();
}

class _PromotionalCarouselState extends State<PromotionalCarousel> {
  late final PageController _controller = PageController(viewportFraction: 0.9);
  late Timer _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_controller.hasClients && widget.promos.isNotEmpty) {
        _page = (_page + 1) % widget.promos.length;
        _controller.animateToPage(
          _page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.promos.isEmpty) {
      return const SizedBox(height: 180);
    }
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.promos.length,
        itemBuilder: (context, i) {
          final p = widget.promos[i];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: PromoCard(
              title: p.title,
              subtitle: p.subtitle,
              backgroundColor: p.color,
              imagePath: p.imagePath, // unificado
              imageSize: 120,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
