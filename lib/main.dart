import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://duktebslocooppxedanv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR1a3RlYnNsb2Nvb3BweGVkYW52Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMzMjYzNTMsImV4cCI6MjA4ODkwMjM1M30.6fa5YWiO-OeZLQUERMPBhrN1jo4cD_SlOeYnY5ZXV-U',
  );
  runApp(const ProviderScope(child: GolfBuanaApp()));
}

class GolfBuanaApp extends ConsumerWidget {
  const GolfBuanaApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'GolfBuana',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
