// lib/features/clubs/presentation/widgets/event_tile.dart
import 'package:clubhub_mobile/core/theme/light.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/event_dto.dart';
import 'package:flutter/material.dart';
import 'package:clubhub_mobile/core/widgets/rsvp_chip.dart';
import 'package:clubhub_mobile/features/events/data/rsvp_repository.dart';

typedef RsvpCallback = Future<void> Function(int eventId, RsvpStatus status);

class EventTile extends StatelessWidget {
  final EventDto event;
  final bool isOwner;
  final RsvpCallback onRsvp;
  final VoidCallback onViewAttendees;
  final VoidCallback? onTap;

  const EventTile({
    super.key,
    required this.event,
    required this.isOwner,
    required this.onRsvp,
    required this.onViewAttendees,
    this.onTap,
  });

  String get _initials {
    final parts = event.title.trim().split(' ');
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return parts.take(2).map((w) => w[0].toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(event.dateTime);
    final subtitle =
        '${date.day}/${date.month}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';

    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      onLongPress:
          isOwner
              ? () async {
                final action = await showMenu<String>(
                  context: context,
                  position: RelativeRect.fill,
                  items: const [
                    PopupMenuItem(value: 'edit', child: Text('Editar')),
                    PopupMenuItem(value: 'delete', child: Text('Eliminar')),
                  ],
                );
                if (action == 'edit') {
                  onTap?.call();
                } else if (action == 'delete') {
                  final ok = await showDialog<bool>(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text('Eliminar evento'),
                          content: const Text(
                            '¿Seguro que deseas eliminar este evento?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancelar'),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Eliminar'),
                            ),
                          ],
                        ),
                  );
                  if (ok == true) {
                    // deletion is handled by ClubEventsTab via onDelete
                  }
                }
              }
              : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            // Icono con iniciales
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                _initials,
                style: tt.titleMedium?.copyWith(
                  color: cs.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            // Título + fecha
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: tt.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    subtitle,
                    style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  ),
                ],
              ),
            ),

            // Ver asistentes
            IconButton(
              icon: const Icon(Icons.people_alt),
              onPressed: onViewAttendees,
            ),

            // Chip RSVP
            RsvpChip(event.myStatus),

            const SizedBox(width: AppSpacing.xs),

            // Menú RSVP al presionar chevron
            PopupMenuButton<RsvpStatus>(
              icon: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
              onSelected: (s) => onRsvp(event.id, s),
              itemBuilder:
                  (_) => const [
                    PopupMenuItem(
                      value: RsvpStatus.Going,
                      child: Text('Asistiré'),
                    ),
                    PopupMenuItem(
                      value: RsvpStatus.Maybe,
                      child: Text('Quizá'),
                    ),
                    PopupMenuItem(
                      value: RsvpStatus.Declined,
                      child: Text('No iré'),
                    ),
                  ],
            ),
          ],
        ),
      ),
    );
  }
}
