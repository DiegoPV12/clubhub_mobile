// lib/features/home/presentation/profile_page.dart
import 'package:clubhub_mobile/core/theme/light.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:clubhub_mobile/core/user/current_user_provider.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/club_tile.dart';

/// Clipper para la curva inferior del header
class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height - 40)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 40,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(old) => false;
}

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);
    final ownedClubs = ref.watch(ownedClubsProvider);
    final memberAsync = ref.watch(memberClubsProvider);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header con curva, avatar, nombre y email
          userAsync.when(
            loading:
                () => const SizedBox(
                  height: 260,
                  child: Center(child: CircularProgressIndicator()),
                ),
            error:
                (e, _) => SizedBox(
                  height: 260,
                  child: Center(child: Text('Error: $e')),
                ),
            data: (user) {
              // Iniciales del nombre
              final parts = user.name.trim().split(' ');
              final initials =
                  parts.length > 1
                      ? parts.take(2).map((w) => w[0]).join().toUpperCase()
                      : user.name[0].toUpperCase();

              return ClipPath(
                clipper: _HeaderClipper(),
                child: Container(
                  height: 260,
                  color: Theme.of(context).colorScheme.primary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        child: Text(
                          initials,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        user.name,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: AppSpacing.lg),

          // ─── Clubes que administro ───────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              'Clubes que administro',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (ownedClubs.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Text('No administras ningún club aún.'),
            )
          else
            ...ownedClubs.map(
              (c) => ClubTile(
                name: c.name,
                description: c.description,
                onTap: () => context.push('/clubs/${c.id}'),
              ),
            ),

          const SizedBox(height: AppSpacing.lg),

          // ─── Clubes que sigues ────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              'Clubes que sigues',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          memberAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error:
                (e, _) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  child: Text('Error: $e'),
                ),
            data: (list) {
              if (list.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Text('No sigues ningún club aún.'),
                );
              }
              return Column(
                children:
                    list
                        .map(
                          (c) => ClubTile(
                            name: c.name,
                            description: c.description,
                            onTap: () => context.push('/clubs/${c.id}'),
                          ),
                        )
                        .toList(),
              );
            },
          ),

          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
