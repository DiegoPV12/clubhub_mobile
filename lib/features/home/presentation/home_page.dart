// lib/features/home/presentation/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../clubs/presentation/vm_clubs.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncClubs = ref.watch(clubsVmProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Clubes')),
      body: asyncClubs.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data:
            (list) => ListView.separated(
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: list.length,
              itemBuilder:
                  (_, i) => ListTile(
                    title: Text(list[i].name),
                    subtitle: Text(list[i].description),
                    onTap: () => context.push('/clubs/${list[i].id}'),
                  ),
            ),
      ),
    );
  }
}
