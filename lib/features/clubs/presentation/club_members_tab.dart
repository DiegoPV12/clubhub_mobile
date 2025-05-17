// lib/features/clubs/presentation/widgets/club_members_tab.dart
import 'package:clubhub_mobile/core/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clubhub_mobile/features/clubs/presentation/widgets/member_tile.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_club_details.dart';

class ClubMembersTab extends ConsumerWidget {
  final int clubId;
  const ClubMembersTab({super.key, required this.clubId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membersAsync = ref.watch(clubDetailVmProvider(clubId)).members;

    return membersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error miembros: $e')),
      data:
          (list) => ListView.separated(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemCount: list.length,
            itemBuilder: (_, i) {
              final m = list[i];
              return MemberTile(
                member: m,
                onTap: () {
                  // Por ejemplo, mostrar perfil o acción futura
                },
              );
            },
          ),
    );
  }
}
