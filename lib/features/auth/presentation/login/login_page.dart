import 'package:clubhub_mobile/features/auth/presentation/login/login_form.dart';
import 'package:clubhub_mobile/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const AuthScaffold(showBack: true, child: LoginForm());
  }
}
