import 'package:flutter/material.dart';

class RoundsPage extends StatelessWidget {
  const RoundsPage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Rounds / Play', icon: Icons.golf_course);
}

class ScorecardPage extends StatelessWidget {
  final String roundId;
  const ScorecardPage({super.key, required this.roundId});
  @override
  Widget build(BuildContext context) => _Placeholder(title: 'Scorecard', icon: Icons.score);
}

class VenuesPage extends StatelessWidget {
  const VenuesPage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Venues', icon: Icons.location_on_outlined);
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Profile', icon: Icons.person_outline);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: const Color(0xFF2E7D32)),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            const Text('Under construction', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
