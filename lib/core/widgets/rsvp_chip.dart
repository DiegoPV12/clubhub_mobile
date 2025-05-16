import 'package:flutter/material.dart';

class RsvpChip extends StatelessWidget {
  const RsvpChip(this.status, {super.key});
  final String? status; // "Going", "Maybe", "Declined" o null

  @override
  Widget build(BuildContext context) {
    if (status == null) return const SizedBox.shrink();

    final (label, color) = switch (status) {
      'Going' => ('Voy', Colors.green.shade600),
      'Maybe' => ('Quizá', Colors.orange.shade600),
      'Declined' => ('No voy', Colors.red.shade600),
      _ => ('', Colors.grey),
    };

    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
