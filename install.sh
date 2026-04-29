#!/bin/sh
set -e
mkdir -p bootstrap/cache storage/framework/cache storage/framework/sessions storage/framework/views
composer install --no-interaction --optimize-autoloader --no-dev
# Kita beri tanda pagar (#) dulu di depan npm supaya tidak berat
# npm install --legacy-peer-deps
# npm run build
cp .env.example .env || true
php artisan key:generate --force
chown -R www-data:www-data bootstrap storage
chmod -R 775 bootstrap storage
