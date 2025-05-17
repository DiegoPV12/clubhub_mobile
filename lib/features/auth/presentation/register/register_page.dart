import 'package:clubhub_mobile/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:flutter/material.dart';
import 'register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const AuthScaffold(showBack: true, child: RegisterForm());
  }
}
