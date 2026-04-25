#!/bin/sh
set -e

# Buat folder yang diperlukan
mkdir -p bootstrap/cache storage/framework/cache storage/framework/sessions storage/framework/views

# Install dependensi (ini yang paling penting)
composer install --no-interaction --optimize-autoloader --no-dev
npm install --legacy-peer-deps
npm run build

# Setup Laravel
cp .env.example .env || true
php artisan key:generate --force

# Beri izin akses folder
chown -R www-data:www-data bootstrap storage
chmod -R 775 bootstrap storage
