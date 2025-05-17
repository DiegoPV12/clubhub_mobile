// lib/features/home/presentation/home_page.dart
import 'package:clubhub_mobile/core/user/current_user_provider.dart';
import 'package:clubhub_mobile/features/clubs/data/clubs_repository.dart';
import 'package:clubhub_mobile/features/clubs/presentation/club_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../clubs/presentation/vm_clubs.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncClubs = ref.watch(clubsVmProvider);
    final currentUserId = ref
        .watch(currentUserProvider)
        .maybeWhen(data: (id) => id, orElse: () => 0);

    return Scaffold(
      appBar: AppBar(title: const Text('Clubes')),

      // -------- LISTA DE CLUBES -----------------------------------------
      body: asyncClubs.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data:
            (list) => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: list.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (_, i) {
                final club = list[i];
                final isOwner = club.ownerId == currentUserId;

                return ListTile(
                  title: Text(club.name),
                  subtitle: Text(club.description),
                  onTap: () => context.push('/clubs/${club.id}'),

                  // Menú contextual solo para propietarios
                  onLongPress:
                      isOwner
                          ? () async {
                            final action = await showMenu<String>(
                              context: context,
                              position: const RelativeRect.fromLTRB(
                                200,
                                400,
                                0,
                                0,
                              ),
                              items: const [
                                PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Editar'),
                                ),
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Eliminar'),
                                ),
                              ],
                            );

                            if (action == 'edit') {
                              final updated = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ClubFormPage(initial: club),
                                ),
                              );
                              if (updated == true) {
                                ref.invalidate(clubsVmProvider);
                              }
                            } else if (action == 'delete') {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder:
                                    (_) => AlertDialog(
                                      title: const Text('Eliminar club'),
                                      content: const Text(
                                        '¿Seguro que deseas eliminar este club?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed:
                                              () =>
                                                  Navigator.pop(context, false),
                                          child: const Text('Cancelar'),
                                        ),
                                        FilledButton(
                                          onPressed:
                                              () =>
                                                  Navigator.pop(context, true),
                                          child: const Text('Eliminar'),
                                        ),
                                      ],
                                    ),
                              );
                              if (confirm == true) {
                                await ref
                                    .read(clubsRepoProvider)
                                    .delete(club.id);
                                ref.invalidate(clubsVmProvider);
                              }
                            }
                          }
                          : null,
                );
              },
            ),
      ),

      // -------- FAB CREAR CLUB ------------------------------------------
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final created = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ClubFormPage()),
          );
          if (created == true) {
            ref.invalidate(clubsVmProvider); // refrescar lista
          }
        },
      ),
    );
  }
}
