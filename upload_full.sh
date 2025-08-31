#!/bin/bash
# === Script Full Upload Project Davin ===
# Buatan DavinTeam 💎

# === KONFIGURASI WAJIB ===
EMAIL="berlianemas23@gmail.com"
USERNAME="dapdap2"                # username GitHub kamu
REPO="DavinApp"                   # nama repository baru
TOKEN="github_pat_xxxxxx"         # ganti dengan token GitHub kamu

# === 1. Buat repository baru lewat API GitHub ===
echo "🚀 Membuat repository $REPO di GitHub..."
curl -H "Authorization: token $TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     https://api.github.com/user/repos \
     -d "{\"name\":\"$REPO\", \"private\":false}"

# === 2. Masuk ke folder project ===
cd /sdcard/Download/davin || { echo "❌ Folder project tidak ditemukan"; exit 1; }

# === 3. Inisialisasi git ===
git init

# === 4. Set identitas git ===
git config --global user.email "$EMAIL"
git config --global user.name "$USERNAME"
git config --global --add safe.directory /sdcard/Download/davin

# === 5. Tambahkan semua file & commit ===
git add .
git commit -m "🚀 Upload full project Davin"

# === 6. Hubungkan ke repository baru ===
git remote remove origin 2>/dev/null
git remote add origin https://$TOKEN@github.com/$USERNAME/$REPO.git

# === 7. Buat branch master & push ===
git branch -M master
git push -u origin master --force

echo "✅ Selesai! Project Davin sudah terupload ke https://github.com/$USERNAME/$REPO


