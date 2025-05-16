// lib/features/events/presentation/attendees_sheet.dart
import 'package:clubhub_mobile/features/events/presentation/vm_event_attendees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendeesSheet extends ConsumerWidget {
  const AttendeesSheet({super.key, required this.eventId});
  final int eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncList = ref.watch(eventAttendeesVmProvider(eventId));

    return SafeArea(
      child: asyncList.when(
        loading:
            () => const SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
        error:
            (e, _) =>
                SizedBox(height: 200, child: Center(child: Text('Error: $e'))),
        data:
            (list) =>
                list.isEmpty
                    ? const SizedBox(
                      height: 200,
                      child: Center(child: Text('Sin RSVP')),
                    )
                    : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: list.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (_, i) {
                        final r = list[i];
                        final (icon, color) = switch (r.status) {
                          'Going' => (Icons.check_circle, Colors.green),
                          'Maybe' => (Icons.help, Colors.orange),
                          'Declined' => (Icons.cancel, Colors.red),
                          _ => (Icons.person, Colors.grey),
                        };
                        return ListTile(
                          leading: Icon(icon, color: color),
                          title: Text(r.userName),
                          subtitle: Text(r.status),
                        );
                      },
                    ),
      ),
    );
  }
}
