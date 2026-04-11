#!/bin/bash
# Jalankan di terminal Codespaces untuk start Flutter Web
echo "🏌️ Starting GolfBuana Flutter Web..."
flutter pub get
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0