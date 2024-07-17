# Użyj oficjalnego obrazu PHP-FPM jako bazowy
FROM php:8.1-fpm

# Zainstaluj rozszerzenia PHP i inne niezbędne pakiety
RUN apt-get update && \
    apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libzip-dev \
    zip \
    unzip && \
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install gd mysqli pdo pdo_mysql zip

# Skopiuj pliki źródłowe ZnoteAAC
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
RUN git clone https://github.com/Znote/ZnoteAAC.git .

# Ustaw prawa dostępu do katalogu
RUN chown -R www-data:www-data /var/www/html

# Uruchom PHP-FPM
CMD ["php-fpm"]