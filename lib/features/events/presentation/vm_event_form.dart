import 'package:clubhub_mobile/features/clubs/domain/models/event_dto.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/event_form_dto.dart';
import 'package:clubhub_mobile/features/events/data/events_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class EventFormState {
  const EventFormState();
}

class FormIdle extends EventFormState {}

class FormLoading extends EventFormState {}

class FormError extends EventFormState {
  final String msg;
  const FormError(this.msg);
}

class FormSuccess extends EventFormState {
  final EventDto event;
  const FormSuccess(this.event);
}

class EventFormVM extends StateNotifier<EventFormState> {
  EventFormVM(this._repo) : super(FormIdle());

  final EventsRepository _repo;

  Future<void> submit({
    required int clubId,
    int? eventId, // null = create, else update
    required EventFormDto dto,
  }) async {
    state = FormLoading();
    try {
      final ev =
          eventId == null
              ? await _repo.create(clubId, dto)
              : await _repo.update(clubId, eventId, dto);
      state = FormSuccess(ev);
    } catch (e) {
      state = FormError(e.toString());
    }
  }
}

final eventFormVmProvider =
    StateNotifierProvider.autoDispose<EventFormVM, EventFormState>((ref) {
      return EventFormVM(ref.watch(eventsRepoProvider));
    });
