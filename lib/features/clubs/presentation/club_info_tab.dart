// lib/features/clubs/presentation/widgets/club_info_tab.dart
import 'package:clubhub_mobile/core/theme/light.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_clubs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:clubhub_mobile/features/clubs/domain/models/club_dto.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_club_details.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/club_image_mapper.dart';

class ClubInfoTab extends ConsumerWidget {
  final ClubDto club;
  const ClubInfoTab({super.key, required this.club});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(clubDetailVmProvider(club.id));
    final vm = ref.read(clubDetailVmProvider(club.id).notifier);
    final isMember = detail.isMember;
    final isOwner = detail.isOwner;
    final members = detail.members;

    String initials(String name) {
      final parts = name.trim().split(' ');
      return parts.length > 1
          ? parts.take(2).map((w) => w[0]).join().toUpperCase()
          : name[0].toUpperCase();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Imagen del club
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              getClubImagePath(club.id),
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // 2. Nombre
          Text(club.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.md),

          // 3. Descripción
          Text(club.description, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.lg),

          // 4. Miembros (avatares)
          Text('Miembros', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          members.when(
            loading:
                () => const Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(),
                  ),
                ),
            error: (e, _) => Text('Error al cargar miembros: $e'),
            data: (list) {
              if (list.isEmpty) return const Text('Aún no hay miembros.');
              final toShow = list.take(5).toList();
              final extra = list.length - toShow.length;
              return SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: toShow.length + (extra > 0 ? 1 : 0),
                  separatorBuilder:
                      (_, __) => const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (_, i) {
                    if (i < toShow.length) {
                      final m = toShow[i];
                      return CircleAvatar(
                        radius: 20,
                        child: Text(initials(m.userName)),
                      );
                    }
                    return Center(
                      child: Text(
                        '+$extra',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: AppSpacing.xl),

          // 5. Botón Unirse/Dejar
          Center(
            child: FilledButton(
              onPressed: () => isMember ? vm.leave() : vm.join(),
              child: Text(isMember ? 'Dejar club' : 'Unirse'),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          // 6. Botón Eliminar (solo owner)
          if (isOwner)
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
                onPressed: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text('Eliminar club'),
                          content: const Text(
                            '¿Estás seguro de que deseas eliminar este club? Esta acción no se puede deshacer.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancelar'),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(color: Colors.red),
                              ),
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Eliminar'),
                            ),
                          ],
                        ),
                  );
                  if (confirm == true) {
                    // ① Llamamos al notifier global para borrar y recargar lista
                    await ref
                        .read(clubsVmProvider.notifier)
                        .deleteClub(club.id);
                    // ② Regresamos al Home, que ya verá la lista actualizada
                    context.go('/home');
                  }
                },
                child: const Text('Eliminar club'),
              ),
            ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
