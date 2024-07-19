# Wykorzystaj oficjalny obraz MariaDB jako bazę
FROM mariadb:latest

# Ustaw zmienne środowiskowe dla konfiguracji bazy danych
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=example_db
ENV MYSQL_USER=example_user
ENV MYSQL_PASSWORD=example_password

# Skopiuj dodatkowe skrypty konfiguracji (opcjonalnie)
# COPY ./my-custom-config.cnf /etc/mysql/conf.d/

# Port do wystawienia
EXPOSE 3306

# Komenda startowa
CMD ["mysqld"]