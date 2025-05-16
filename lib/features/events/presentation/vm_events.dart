// lib/features/events/presentation/vm_events.dart
import 'package:clubhub_mobile/features/clubs/domain/models/event_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/events_repository.dart';
import '../data/rsvp_repository.dart';

final eventsVmProvider = FutureProvider.family.autoDispose<List<EventDto>, int>(
  (ref, clubId) {
    final repo = ref.watch(eventsRepoProvider);
    return repo.fetchForClub(clubId);
  },
);

final rsvpActionProvider =
    Provider.family<Future<void> Function(int, RsvpStatus), int>((ref, clubId) {
      final repo = ref.watch(rsvpRepoProvider);
      return (int eventId, RsvpStatus s) async {
        await repo.send(eventId, s);
        ref.invalidate(eventsVmProvider(clubId)); // refresca lista
      };
    });
