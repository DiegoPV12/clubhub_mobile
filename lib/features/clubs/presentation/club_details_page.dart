// lib/features/clubs/presentation/club_detail_page.dart
import 'package:clubhub_mobile/features/clubs/presentation/club_events_tab.dart';
import 'package:clubhub_mobile/features/clubs/presentation/club_info_tab.dart';
import 'package:clubhub_mobile/features/clubs/presentation/club_members_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/vm_club_details.dart';

class ClubDetailPage extends ConsumerWidget {
  const ClubDetailPage(this.clubId, {super.key});
  final int clubId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clubDetailVmProvider(clubId));

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: state.club.when(
          data: (c) => Text(c.name),
          loading: () => const Text('Club'),
          error: (_, __) => const Text('Error'),
        ),
        // quitamos el botón “Dejar/Unirse” de aquí
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
                  const Divider(height: 1),
                  // ← aquí damos el espacio al TabBarView
                  Expanded(
                    child: TabBarView(
                      children: [
                        ClubInfoTab(club: club),
                        ClubEventsTab(clubId: club.id),
                        ClubMembersTab(clubId: club.id),
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
