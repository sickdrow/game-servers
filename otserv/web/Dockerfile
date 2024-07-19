# Wykorzystaj oficjalny obraz PHP z Apache
FROM php:7.4-apache

# Skopiuj pliki konfiguracyjne, jeśli istnieją
# COPY ./my-custom-config.conf /etc/apache2/sites-available/000-default.conf

# Instalacja dodatkowych rozszerzeń PHP (jeśli potrzebne)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Ustawienie prawidłowych uprawnień dla katalogów (jeśli potrzebne)
# RUN chown -R www-data:www-data /var/www/html

# Port do wystawienia
EXPOSE 80

# Komenda startowa
CMD ["apache2-foreground"]