# Używamy oficjalnego obrazu PHP z Apache
FROM php:7.4-apache

# Ustawiamy zmienną środowiskową do przeskakiwania interaktywnego trybu instalacji
ENV DEBIAN_FRONTEND=noninteractive

# Instalujemy zależności systemowe
RUN apt-get update && apt-get install -y \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Instalujemy rozszerzenia PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip

# Ustawiamy katalog roboczy w kontenerze
WORKDIR /var/www/html

# Pobieramy kod źródłowy aplikacji ZNoteACC z GitHub
RUN git clone https://github.com/znote/ZNoteACC.git .

# Kopiujemy przykładowy plik konfiguracyjny Apache do ustawienia mod_rewrite
COPY apache2.conf /etc/apache2/apache2.conf

# Otwieramy port 80, który będzie używany przez Apache
EXPOSE 8080

# Startujemy serwer Apache
CMD ["apache2-foreground"]