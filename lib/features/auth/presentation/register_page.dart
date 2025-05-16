// lib/features/auth/presentation/register_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'vm_register.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerVmProvider);
    final vm = ref.read(registerVmProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator:
                    (v) =>
                        (v == null || v.trim().length < 2)
                            ? 'Introduce tu nombre'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Correo'),
                validator:
                    (v) =>
                        (v == null || !v.contains('@'))
                            ? 'Correo inválido'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passCtrl,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator:
                    (v) =>
                        (v == null || v.length < 6)
                            ? 'Mínimo 6 caracteres'
                            : null,
              ),
              const SizedBox(height: 24),
              _buildButton(state, vm),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(RegisterState state, RegisterViewModel vm) {
    if (state is RegisterLoading) {
      return const CircularProgressIndicator();
    } else if (state is RegisterError) {
      return Text(state.message, style: const TextStyle(color: Colors.red));
    } else {
      return FilledButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            vm.register(_nameCtrl.text.trim(), _emailCtrl.text, _passCtrl.text);
          }
        },
        child: const Text('Crear cuenta'),
      );
    }
  }
}
