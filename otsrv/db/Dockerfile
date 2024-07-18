# Użyj oficjalny obraz Ubuntu jako bazowy
FROM ubuntu:20.04

# Zaktualizuj i zainstaluj wymagane pakiety
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libncurses5-dev \
    libssl-dev \
    libboost-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    bison \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Klonuj repozytorium MariaDB z GitHub
RUN git clone https://github.com/MariaDB/server.git /usr/src/mariadb

# Ustaw katalog roboczy
WORKDIR /usr/src/mariadb

# Skonfiguruj, skompiluj i zainstaluj MariaDB
RUN cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
    -DMYSQL_DATADIR=/usr/local/mysql/data \
    -DSYSCONFDIR=/etc/mysql \
    -DWITH_SSL=system \
    -DWITH_INNOBASE_STORAGE_ENGINE=1 \
    -DWITH_PARTITION_STORAGE_ENGINE=1 \
    -DWITH_EXTRA_CHARSETS=all \
    -DDEFAULT_CHARSET=utf8mb4 \
    -DDEFAULT_COLLATION=utf8mb4_unicode_ci \
    && make \
    && make install

# Tworzenie katalogu na pliki konfiguracyjne
RUN mkdir -p /etc/mysql/conf.d

# Skopiuj plik konfiguracyjny my.cnf do katalogu /etc/mysql/conf.d
COPY ./my.cnf /etc/mysql/conf.d/my.cnf

# Skopiuj skrypt SQL do inicjalizacji bazy danych
COPY ./initial.sql /docker-entrypoint-initdb.d/initial.sql

# Ustaw zmienne środowiskowe
ENV MYSQL_ROOT_PASSWORD=example

# Inicjalizuj katalog danych i ustawienia
RUN /usr/local/mysql/scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data

# Eksponuj port 3306
EXPOSE 3306

# Ustaw ENTRYPOINT aby uruchamiać MariaDB
ENTRYPOINT ["/usr/local/mysql/bin/mysqld", "--defaults-file=/etc/mysql/conf.d/my.cnf"]

# Polecenie CMD aby uruchomić MariaDB
CMD ["--user=mysql", "--console"]