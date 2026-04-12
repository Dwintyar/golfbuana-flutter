import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/lounge/pages/lounge_page.dart';
import '../../features/placeholder_pages.dart';
import '../../features/shell/app_shell.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/lounge',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/lounge', builder: (context, state) => const LoungePage()),
          GoRoute(path: '/clubs', builder: (context, state) => const ClubsPage()),
          GoRoute(path: '/rounds', builder: (context, state) => const RoundsPage()),
          GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
        ],
      ),
    ],
  );
});
