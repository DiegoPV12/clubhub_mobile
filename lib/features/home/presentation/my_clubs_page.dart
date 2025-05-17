// lib/features/home/presentation/my_clubs_page.dart
import 'package:clubhub_mobile/core/theme/light.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/club_tile.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/promo.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/promo_card.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_clubs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyClubsPage extends ConsumerWidget {
  const MyClubsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncClubs = ref.watch(clubsVmProvider);

    const createPromo = Promo(
      title: 'Crear un club',
      subtitle: 'Da vida a tu propia comunidad',
      color: Colors.green,
      imagePath: 'assets/images/promo_create.png',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis clubes'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.lg),

            // PromoCard acción
            PromoCard(
              title: createPromo.title,
              subtitle: createPromo.subtitle,
              backgroundColor: createPromo.color,
              imagePath: createPromo.imagePath,
              imageSize: 120,
              onTap: () => context.push('/clubs/new'),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Lista de clubes con separador
            Expanded(
              child: asyncClubs.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
                data:
                    (list) => ListView.separated(
                      itemCount: list.length,
                      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                      separatorBuilder:
                          (_, __) => const Divider(
                            height: 1,
                            indent: AppSpacing.md,
                            endIndent: AppSpacing.md,
                          ),
                      itemBuilder: (_, i) {
                        final club = list[i];
                        return ClubTile(
                          name: club.name,
                          description: club.description,
                          onTap: () => context.push('/clubs/${club.id}'),
                        );
                      },
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
