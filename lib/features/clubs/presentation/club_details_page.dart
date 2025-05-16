import 'package:clubhub_mobile/core/widgets/rsvp_chip.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_club_details.dart';
import 'package:clubhub_mobile/features/events/data/rsvp_repository.dart';
import 'package:clubhub_mobile/features/events/presentation/attendees_sheet.dart';
import 'package:clubhub_mobile/features/events/presentation/vm_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClubDetailPage extends ConsumerWidget {
  const ClubDetailPage(this.clubId, {super.key});
  final int clubId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clubDetailVmProvider(clubId));
    final vm = ref.read(clubDetailVmProvider(clubId).notifier);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(), // ← back
        title: state.club.when(
          data: (c) => Text(c.name),
          loading: () => const Text('Club'),
          error: (_, __) => const Text('Error'),
        ),
        actions: [
          if (state.club is AsyncData)
            TextButton(
              onPressed: state.isMember ? vm.leave : vm.join,
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(state.isMember ? 'Dejar' : 'Unirse'),
            ),
        ],
      ),
      body: state.club.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data:
            (club) => DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Info'),
                      Tab(text: 'Eventos'),
                      Tab(text: 'Miembros'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Info
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(club.description),
                        ),
                        // Eventos (stub)
                        // ---------- Pestaña Eventos ----------
                        Consumer(
                          builder: (_, ref, __) {
                            final asyncEvents = ref.watch(
                              eventsVmProvider(clubId),
                            );

                            final rsvp = ref.watch(rsvpActionProvider(clubId));

                            return asyncEvents.when(
                              loading:
                                  () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              error:
                                  (e, _) =>
                                      Center(child: Text('Error eventos: $e')),
                              data:
                                  (list) => ListView.separated(
                                    padding: const EdgeInsets.all(16),
                                    itemCount: list.length,
                                    separatorBuilder:
                                        (_, __) => const Divider(),
                                    itemBuilder: (_, i) {
                                      final ev = list[i];
                                      final date = DateTime.parse(ev.dateTime);
                                      return ListTile(
                                        title: Text(ev.title),
                                        subtitle: Text(
                                          '${ev.location ?? 'Sin lugar'} · '
                                          '${date.day}/${date.month}/${date.year} '
                                          '${date.hour}:${date.minute.toString().padLeft(2, '0')}',
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // botón ver asistentes
                                            IconButton(
                                              icon: const Icon(
                                                Icons.people_alt,
                                              ),
                                              onPressed:
                                                  () => showModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (_) => AttendeesSheet(
                                                          eventId: ev.id,
                                                        ),
                                                  ),
                                            ),
                                            // chip estado personal
                                            RsvpChip(ev.myStatus),
                                            // menú RSVP
                                            PopupMenuButton<RsvpStatus>(
                                              onSelected: (s) => rsvp(ev.id, s),
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
                                                      value:
                                                          RsvpStatus.Declined,
                                                      child: Text('No iré'),
                                                    ),
                                                  ],
                                              icon: const Icon(Icons.more_vert),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                            );
                          },
                        ),
                        // Miembros
                        state.members.when(
                          loading:
                              () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          error:
                              (e, _) =>
                                  Center(child: Text('Error miembros: $e')),
                          data:
                              (members) => ListView.builder(
                                itemCount: members.length,
                                itemBuilder:
                                    (_, i) => ListTile(
                                      leading: const Icon(Icons.person),
                                      title: Text(members[i].userName),
                                    ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
