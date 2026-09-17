set -e

echo "🚀 [Deploy] Memulai proses deploy..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "📥 [Git] Mengambil perubahan terbaru dari branch main..."
git fetch origin main
git reset --hard origin/main

echo "🐳 [Docker] Membangun ulang dan menyalakan container..."
docker compose up -d --build

echo "🧹 [Docker] Membersihkan dangling images lama..."
docker image prune -f

echo "✅ [Deploy] Deployment selesai dan website berhasil diperbarui!"
