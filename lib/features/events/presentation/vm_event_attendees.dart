import 'package:clubhub_mobile/features/clubs/domain/models/rsvp_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/attendees_repository.dart';

final eventAttendeesVmProvider = FutureProvider.family
    .autoDispose<List<RsvpDto>, int>((ref, eventId) {
      final repo = ref.watch(attendeesRepoProvider);
      return repo.fetch(eventId);
    });
