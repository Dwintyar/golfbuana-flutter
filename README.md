# GolfBuana Flutter

Cross-platform app (Android, iOS, Web, Desktop) built with Flutter.  
Backend: Supabase (shared with GolfBuana PWA).

---

## 🚀 Buka di GitHub Codespaces

Tidak perlu install apapun di komputer Anda.

1. Klik tombol hijau **`<> Code`** di repo ini
2. Pilih tab **Codespaces**
3. Klik **"Create codespace on main"**
4. Tunggu ~2–3 menit hingga environment siap
5. Flutter SDK sudah terinstall otomatis

---

## ▶️ Jalankan di Browser (Flutter Web)

Di terminal Codespaces:

```bash
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
```

Browser akan otomatis terbuka menampilkan app.

---

## 📱 Build Android APK

```bash
flutter build apk --release
```

File APK tersimpan di: `build/app/outputs/flutter-apk/app-release.apk`

---

## 🏗️ Struktur Project

```
lib/
├── main.dart              # Entry point
├── core/
│   ├── constants/         # Supabase URL, keys, colors
│   ├── theme/             # App theme, typography
│   └── router/            # Go Router navigation
├── features/
│   ├── auth/              # Login, register
│   ├── rounds/            # Scorecard, round tracking
│   ├── clubs/             # Club list, detail, members
│   ├── venues/            # Course list, booking
│   ├── profile/           # User profile, HCP
│   └── cooperative/       # GBPlay cooperative page
└── shared/
    ├── widgets/           # Reusable UI components
    └── services/          # Supabase client, auth service
```

---

## 🔑 Environment Variables

Buat file `.env` di root project (jangan di-commit):

```
SUPABASE_URL=https://duktebslocooppxedanv.supabase.co
SUPABASE_ANON_KEY=your_anon_key_here
```

---

## 📸 UI Reference

Screenshots referensi UI tersimpan di folder `/screenshots/`  
Dikelompokkan per flow: auth, rounds, clubs, venues, profile, cooperative.

---

## 🛠️ Tech Stack

| Layer | Tool |
|---|---|
| Framework | Flutter (Dart) |
| Backend | Supabase |
| Navigation | go_router |
| State | Riverpod |
| HTTP/Realtime | supabase_flutter |
| Local storage | flutter_secure_storage |
| Images | cached_network_image |