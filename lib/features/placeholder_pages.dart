import 'package:flutter/material.dart';

class VenuesPage extends StatelessWidget {
  const VenuesPage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Venues', icon: Icons.golf_course_outlined);
}

class CooperativePage extends StatelessWidget {
  const CooperativePage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Cooperative', icon: Icons.handshake_outlined);
}

class _Placeholder extends StatelessWidget {
  final String title;
  final IconData icon;
  const _Placeholder({required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Icon(icon, size: 64, color: const Color(0xFF2E7D32))),
    );
  }
}
