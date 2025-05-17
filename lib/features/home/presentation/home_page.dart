// lib/features/home/presentation/home_page.dart
import 'package:clubhub_mobile/core/theme/light.dart';
import 'package:clubhub_mobile/core/user/current_user_provider.dart';
import 'package:clubhub_mobile/core/widgets/search_bar_m3.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/popular_carousel.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/promotional_carousel.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/promo.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_clubs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncClubs = ref.watch(clubsVmProvider);
    final currentUserId = ref
        .watch(currentUserProvider)
        .maybeWhen(data: (id) => id, orElse: () => 0);

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
      // AppBar transparente con título de la app
      appBar: AppBar(
        title: const Text('ClubHub'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: CustomScrollView(
        slivers: [
          // SearchBar flotante
          SliverAppBar(
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: const SearchBarM3(),
          ),

          // Sección: Promociones
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.sm,
              ),
              child: Text(
                'Promociones',
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

          // Sección: Popular Clubs
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

          // Sección: Mis clubes
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.sm,
              ),
              child: Text(
                'Mis clubes',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),

          // Lista de clubes
          asyncClubs.when(
            loading:
                () => SliverFillRemaining(
                  hasScrollBody: false,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            error:
                (e, _) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('Error: $e')),
                ),
            data:
                (list) => SliverList(
                  delegate: SliverChildBuilderDelegate((_, i) {
                    final club = list[i];
                    final isOwner = club.ownerId == currentUserId;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.xs,
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        tileColor:
                            Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                        title: Text(club.name),
                        subtitle: Text(club.description),
                        onTap: () => context.push('/clubs/${club.id}'),
                        onLongPress:
                            isOwner
                                ? () {
                                  /*…*/
                                }
                                : null,
                      ),
                    );
                  }, childCount: list.length),
                ),
          ),
        ],
      ),

      // FAB crear club
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/clubs/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
