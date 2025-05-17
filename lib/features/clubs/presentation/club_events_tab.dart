// lib/features/clubs/presentation/club_events_tab.dart
import 'package:clubhub_mobile/core/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clubhub_mobile/features/clubs/presentation/widgets/event_tile.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_club_details.dart';
import 'package:clubhub_mobile/features/events/presentation/vm_events.dart';
import 'package:clubhub_mobile/features/events/presentation/attendees_sheet.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/promo_card.dart';
import 'package:clubhub_mobile/features/home/presentation/widgets/promo.dart';
import 'package:go_router/go_router.dart';

class ClubEventsTab extends ConsumerWidget {
  final int clubId;
  const ClubEventsTab({super.key, required this.clubId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventsVmProvider(clubId));
    final isOwner = ref.watch(clubDetailVmProvider(clubId)).isOwner;
    final rsvpAction = ref.watch(rsvpActionProvider(clubId));

    const createPromo = Promo(
      title: 'Crear evento',
      subtitle: 'Añade una nueva actividad',
      color: Colors.purple,
      imagePath: 'assets/images/promo_create_event.png',
    );

    return eventsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error eventos: $e')),
      data: (list) {
        final total = list.length + (isOwner ? 1 : 0);
        return ListView.separated(
          padding: const EdgeInsets.only(top: AppSpacing.sm),
          itemCount: total,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (_, i) {
            // ① PromoCard de creación
            if (isOwner && i == 0) {
              return Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: PromoCard(
                  title: createPromo.title,
                  subtitle: createPromo.subtitle,
                  backgroundColor: createPromo.color,
                  imagePath: createPromo.imagePath,
                  imageSize: 120,
                  onTap: () async {
                    // esperamos el resultado del formulario
                    final created = await context.push<bool?>(
                      '/clubs/$clubId/events/new',
                    );
                    if (created == true) {
                      ref.invalidate(eventsVmProvider(clubId));
                    }
                  },
                ),
              );
            }

            // ② Tiles de evento
            final ev = list[i - (isOwner ? 1 : 0)];
            return EventTile(
              event: ev,
              isOwner: isOwner,
              onViewAttendees:
                  () => showModalBottomSheet(
                    context: context,
                    builder: (_) => AttendeesSheet(eventId: ev.id),
                  ),
              onRsvp: (id, status) async {
                await rsvpAction(id, status);
                ref.invalidate(eventsVmProvider(clubId));
              },
              onTap:
                  isOwner
                      ? () async {
                        // al tocar, vamos a la edición
                        final updated = await context.push<bool?>(
                          '/clubs/$clubId/events/${ev.id}/edit',
                          extra: ev,
                        );
                        if (updated == true) {
                          ref.invalidate(eventsVmProvider(clubId));
                        }
                      }
                      : null,
            );
          },
        );
      },
    );
  }
}
