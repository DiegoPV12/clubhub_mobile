// lib/features/clubs/presentation/widgets/member_tile.dart
import 'package:clubhub_mobile/core/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/member_dto.dart';

class MemberTile extends StatelessWidget {
  /// Datos del miembro.
  final MemberDto member;

  /// Callback opcional al pulsar la fila.
  final VoidCallback? onTap;

  const MemberTile({super.key, required this.member, this.onTap});

  String get _initials {
    final parts = member.userName.trim().split(' ');
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return parts.take(2).map((w) => w[0].toUpperCase()).join();
  }

  int get _daysSinceJoined {
    final joined = DateTime.parse(member.joinedOn);
    return DateTime.now().difference(joined).inDays;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            // Avatar con iniciales
            CircleAvatar(
              radius: 24,
              backgroundColor: cs.primaryContainer,
              child: Text(
                _initials,
                style: tt.titleMedium?.copyWith(
                  color: cs.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            // Nombre y badge de días
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.userName,
                    style: tt.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Miembro por $_daysSinceJoined días',
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
