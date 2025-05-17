// lib/features/clubs/presentation/club_form_page.dart
import 'package:clubhub_mobile/features/clubs/domain/models/club_dto.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/club_form_dto.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_club_form.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_clubs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClubFormPage extends ConsumerStatefulWidget {
  const ClubFormPage({super.key, this.initial});
  final ClubDto? initial;

  @override
  ConsumerState<ClubFormPage> createState() => _ClubFormPageState();
}

class _ClubFormPageState extends ConsumerState<ClubFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _name, _desc;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.initial?.name ?? '');
    _desc = TextEditingController(text: widget.initial?.description ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(clubFormVmProvider);
    final vm = ref.read(clubFormVmProvider.notifier);

    ref.listen<ClubFormState>(clubFormVmProvider, (prev, next) {
      if (next is ClubSuccess) {
        ref.invalidate(clubsVmProvider);
        Navigator.pop(context, true);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initial == null ? 'Nuevo club' : 'Editar club'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator:
                    (v) => (v == null || v.isEmpty) ? 'Obligatorio' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _desc,
                decoration: const InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              if (state is ClubError)
                Text(state.msg, style: const TextStyle(color: Colors.red)),
              FilledButton(
                onPressed:
                    state is ClubLoading
                        ? null
                        : () {
                          if (_formKey.currentState!.validate()) {
                            vm.submit(
                              id: widget.initial?.id,
                              dto: ClubFormDto(
                                name: _name.text,
                                description: _desc.text,
                              ),
                            );
                          }
                        },
                child:
                    state is ClubLoading
                        ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : Text(widget.initial == null ? 'Crear' : 'Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
