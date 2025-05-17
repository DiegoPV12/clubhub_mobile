// lib/features/home/presentation/home_page.dart
import 'package:clubhub_mobile/core/theme/light.dart';
import 'package:clubhub_mobile/core/widgets/search_bar_m3.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/popular_carousel.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/promotional_carousel.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/promo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock de promos
    final promos = <Promo>[
      const Promo(
        title: 'Únete a nuevos clubs',
        subtitle: 'Descubre grupos afines a tus intereses',
        color: Colors.deepPurple,
        imagePath: 'assets/images/promo_join.png',
      ),
      const Promo(
        title: 'Organiza eventos',
        subtitle: 'Crea y gestiona encuentros fácilmente',
        color: Colors.indigo,
        imagePath: 'assets/images/promo_events.png',
      ),
      const Promo(
        title: 'Interactúa',
        subtitle: 'Chatea y colabora con la comunidad',
        color: Colors.teal,
        imagePath: 'assets/images/promo_chat.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ClubHub',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: const SearchBarM3(),
            ),
          ),

          // Promociones
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.sm,
              ),
              child: Text(
                'Bienvenido',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: PromotionalCarousel(promos: promos),
            ),
          ),

          // Popular Clubs
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.sm,
              ),
              child: Text(
                'Popular Clubs',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: PopularCarousel(),
            ),
          ),
        ],
      ),
      // FAB removido
    );
  }
}
