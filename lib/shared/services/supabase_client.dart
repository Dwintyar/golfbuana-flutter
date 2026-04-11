import 'package:supabase_flutter/supabase_flutter.dart';

// Shared Supabase client — same DB as PWA, no conflict
final supabase = Supabase.instance.client;

// Auth helpers
String? get currentUserId => supabase.auth.currentUser?.id;
bool get isLoggedIn => supabase.auth.currentSession != null;