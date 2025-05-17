// lib/features/events/presentation/event_form_page.dart
import 'package:clubhub_mobile/features/clubs/domain/models/event_dto.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/event_form_dto.dart';
import 'package:clubhub_mobile/features/events/data/events_repository.dart';
import 'package:clubhub_mobile/features/events/presentation/vm_event_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventFormPage extends ConsumerStatefulWidget {
  const EventFormPage({super.key, required this.clubId, this.initial});

  final int clubId;
  final EventDto? initial;

  @override
  ConsumerState<EventFormPage> createState() => _EventFormPageState();
}

class _EventFormPageState extends ConsumerState<EventFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _title, _desc, _loc;
  DateTime? _date;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.initial?.title ?? '');
    _desc = TextEditingController(text: widget.initial?.description ?? '');
    _loc = TextEditingController(text: widget.initial?.location ?? '');
    _date =
        widget.initial == null
            ? null
            : DateTime.parse(widget.initial!.dateTime);
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final d = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
      initialDate: _date ?? now,
    );
    if (d == null) return;
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_date ?? now),
    );
    if (t == null) return;
    setState(() {
      _date = DateTime(d.year, d.month, d.day, t.hour, t.minute);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventFormVmProvider);
    final vm = ref.read(eventFormVmProvider.notifier);

    // Cuando la creación o edición sea exitosa, cerramos y devolvemos true.
    ref.listen<EventFormState>(eventFormVmProvider, (prev, next) {
      if (next is FormSuccess) {
        Navigator.pop(context, true);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initial == null ? 'Nuevo evento' : 'Editar evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Título
              TextFormField(
                controller: _title,
                decoration: const InputDecoration(labelText: 'Título'),
                validator:
                    (v) => (v == null || v.isEmpty) ? 'Obligatorio' : null,
              ),
              const SizedBox(height: 12),

              // Descripción
              TextFormField(
                controller: _desc,
                decoration: const InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
              ),
              const SizedBox(height: 12),

              // Lugar
              TextFormField(
                controller: _loc,
                decoration: const InputDecoration(labelText: 'Lugar'),
              ),
              const SizedBox(height: 12),

              // Fecha y hora
              ListTile(
                title: Text(
                  _date == null
                      ? 'Fecha y hora'
                      : _date!.toLocal().toString().substring(0, 16),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),
              const SizedBox(height: 24),

              // Error en formulario
              if (state is FormError)
                Text(state.msg, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 8),

              // Botón Crear/Guardar
              FilledButton(
                onPressed:
                    state is FormLoading
                        ? null
                        : () {
                          if (_formKey.currentState!.validate() &&
                              _date != null) {
                            final dto = EventFormDto(
                              title: _title.text,
                              description: _desc.text,
                              dateTime: _date!.toUtc().toIso8601String(),
                              location: _loc.text,
                            );
                            vm.submit(
                              clubId: widget.clubId,
                              eventId: widget.initial?.id,
                              dto: dto,
                            );
                          }
                        },
                child:
                    state is FormLoading
                        ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : Text(widget.initial == null ? 'Crear' : 'Guardar'),
              ),

              // Espacio antes del botón Eliminar
              if (widget.initial != null) const SizedBox(height: 16),

              // Botón Eliminar (solo en edición)
              if (widget.initial != null)
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                  ),
                  onPressed: () async {
                    final ok = await showDialog<bool>(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                            title: const Text('Eliminar evento'),
                            content: const Text(
                              '¿Seguro de eliminar este evento? '
                              'Esta acción no se puede deshacer.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancelar'),
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  side: const BorderSide(color: Colors.red),
                                ),
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Eliminar'),
                              ),
                            ],
                          ),
                    );
                    if (ok == true) {
                      // Borra en backend y luego cierra con true
                      await ref
                          .read(eventsRepoProvider)
                          .delete(widget.clubId, widget.initial!.id);
                      Navigator.pop(context, true);
                    }
                  },
                  child: const Text('Eliminar evento'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
