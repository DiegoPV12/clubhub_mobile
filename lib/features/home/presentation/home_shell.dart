// lib/features/home/presentation/home_shell.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_clubs_page.dart';
import 'profile_page.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _idx = 0;
  static const _tabs = [
    NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
    NavigationDestination(icon: Icon(Icons.group), label: 'Mis clubes'),
    NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [const HomePage(), const MyClubsPage(), const ProfilePage()];

    return Scaffold(
      body: pages[_idx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _idx,
        destinations: _tabs,
        onDestinationSelected: (i) => setState(() => _idx = i),
      ),
    );
  }
}
