FROM php:8.1-apache
RUN docker-php-ext-install pdo_mysql
WORKDIR /var/www/html
COPY . .
# Kita buat folder palsu supaya Laravel tidak protes
RUN mkdir -p storage bootstrap/cache vendor && \
    touch vendor/autoload.php && \
    chmod -R 777 storage bootstrap/cache
EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000"]
