# GolfBuana Flutter — Ground Rules & Config Reference

Dokumen ini adalah acuan utama agar Flutter tidak conflict
dengan PWA/TWA/Expo yang sudah berjalan di golfbuana.com.

---

## 🔒 Platform Separation (JANGAN DIUBAH)

| Platform     | Domain                  | Package / Bundle ID        | Status      |
|---|---|---|---|
| PWA (React)  | golfbuana.com           | —                          | ✅ Production |
| TWA Android  | golfbuana.com           | com.golfbuana.app          | ✅ Production |
| Expo         | (sesuai config expo)    | (sesuai config expo)       | ✅ Running   |
| Flutter Web  | app.golfbuana.com       | —                          | 🆕 Baru     |
| Flutter Android | app.golfbuana.com    | com.golfbuana.flutter      | 🆕 Baru     |
| Flutter iOS  | app.golfbuana.com       | com.golfbuana.flutter      | 🆕 Baru     |
| Flutter Desktop | —                    | com.golfbuana.flutter      | 🆕 Baru     |

---

## 🔑 Identifiers Flutter (WAJIB KONSISTEN)

```
App Name (display)  : GolfBuana
Package ID Android  : com.golfbuana.flutter
Bundle ID iOS       : com.golfbuana.flutter
Web Domain          : app.golfbuana.com
Deep link scheme    : golfbuana-app://
```

> ⚠️ JANGAN gunakan com.golfbuana.app — itu milik TWA yang sudah di Play Store

---

## 🗄️ Backend Supabase (SHARED — tidak perlu diubah)

```
Project Ref  : duktebslocooppxedanv
URL          : https://duktebslocooppxedanv.supabase.co
Owner        : dwintyar@gmail.com
```

Flutter dan PWA menggunakan Supabase yang **sama persis**.
Tidak ada duplikasi database. Satu sumber kebenaran.

---

## 🌐 DNS Setup (tambahkan di Vercel/DNS provider)

```
Type    : CNAME
Name    : app
Value   : cname.vercel-dns.com  (atau sesuai provider)
```

Setelah ini app.golfbuana.com aktif untuk Flutter Web.
golfbuana.com tetap tidak berubah untuk PWA.

---

## 📱 assetlinks.json (JANGAN DIUBAH yang existing)

File yang sudah ada di golfbuana.com/.well-known/assetlinks.json
adalah milik TWA (com.golfbuana.app) — JANGAN dimodifikasi.

Flutter Android nanti akan punya assetlinks sendiri di:
app.golfbuana.com/.well-known/assetlinks.json
dengan package: com.golfbuana.flutter

---

## 🏗️ Repo Structure

```
github.com/Dwintyar/golfbuana-flutter   ← repo ini (BARU)
github.com/Dwintyar/cfgolf              ← repo PWA (JANGAN diubah)
```

---

## ✅ Checklist Sebelum Deploy Flutter

- [ ] Package ID di pubspec.yaml = com.golfbuana.flutter
- [ ] AndroidManifest.xml applicationId = com.golfbuana.flutter
- [ ] iOS Bundle ID = com.golfbuana.flutter
- [ ] Flutter Web deploy ke app.golfbuana.com (bukan golfbuana.com)
- [ ] assetlinks.json Flutter di app.golfbuana.com (bukan golfbuana.com)
- [ ] Supabase URL & anon key sama dengan PWA
- [ ] .env tidak di-commit ke GitHub

---

## 📸 UI Reference

Screenshots ada di /screenshots/ dikelompokkan:
- /screenshots/auth/
- /screenshots/rounds/
- /screenshots/clubs/
- /screenshots/venues/
- /screenshots/profile/
- /screenshots/cooperative/

Target: Flutter UI mirip 95-100% dengan screenshots.