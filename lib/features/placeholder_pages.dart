// ============================================================
// PLACEHOLDER PAGES — akan diganti screen by screen
// berdasarkan screenshots referensi
// ============================================================

import 'package:flutter/material.dart';


// ROUNDS
class RoundsPage extends StatelessWidget {
  const RoundsPage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Rounds / Play', icon: Icons.golf_course);
}

class ScorecardPage extends StatelessWidget {
  final String roundId;
  const ScorecardPage({super.key, required this.roundId});
  @override
  Widget build(BuildContext context) => _Placeholder(title: 'Scorecard — $roundId', icon: Icons.score);
}

// CLUBS
class ClubsPage extends StatelessWidget {
  const ClubsPage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Clubs', icon: Icons.groups);
}

class ClubDetailPage extends StatelessWidget {
  final String clubId;
  const ClubDetailPage({super.key, required this.clubId});
  @override
  Widget build(BuildContext context) => _Placeholder(title: 'Club Detail — $clubId', icon: Icons.groups);
}

// VENUES
class VenuesPage extends StatelessWidget {
  const VenuesPage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Venues', icon: Icons.location_on_outlined);
}

class VenueDetailPage extends StatelessWidget {
  final String venueId;
  const VenueDetailPage({super.key, required this.venueId});
  @override
  Widget build(BuildContext context) => _Placeholder(title: 'Venue Detail — $venueId', icon: Icons.location_on);
}

// PROFILE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Profile', icon: Icons.person_outline);
}

// COOPERATIVE
class CooperativePage extends StatelessWidget {
  const CooperativePage({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'GBPlay Cooperative', icon: Icons.handshake_outlined);
}

// ============================================================
// SHARED PLACEHOLDER WIDGET
// ============================================================
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
            Icon(icon, size: 64, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Under construction\nWill match screenshots',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}