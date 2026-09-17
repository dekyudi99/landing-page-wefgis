#!/bin/bash
set -e

echo "🚀 [Deploy] Memulai proses deploy..."

# 1. Pastikan berada di direktori project
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# 2. Ambil perubahan terbaru dari repository
echo "📥 [Git] Mengambil perubahan terbaru dari branch main..."
git fetch origin main
git reset --hard origin/main

# 3. Build dan jalankan ulang container Docker
echo "🐳 [Docker] Membangun ulang dan menyalakan container..."
docker compose up -d --build

# 4. Bersihkan docker image yang sudah tidak terpakai agar disk tidak penuh
echo "🧹 [Docker] Membersihkan dangling images lama..."
docker image prune -f

echo "✅ [Deploy] Deployment selesai dan website berhasil diperbarui!"
