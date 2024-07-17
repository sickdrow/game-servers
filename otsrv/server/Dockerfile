# Użyj oficjalnego obrazu Ubuntu jako bazowy
FROM ubuntu:24.04

# Zaktualizuj system i zainstaluj wymagane pakiety
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    git \
    cmake \
    make \
    g++ \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-regex-dev \
    libboost-iostreams-dev \
    libboost-date-time-dev \
    libboost-chrono-dev \
    libboost-context-dev \
    libboost-coroutine-dev \
    libpugixml-dev \
    liblua5.2-dev \
    libmysqlclient-dev \
    libgmp-dev \
    libssl-dev \
    libcrypto++-dev \
    libsqlite3-dev \
    zlib1g-dev \
    pkg-config \
    libmariadb-dev

# Skopiuj kod źródłowy The Forgotten Server
RUN git clone https://github.com/otland/forgottenserver.git /forgottenserver

# Skopiuj konfiguracje i skompiluj serwer
WORKDIR /forgottenserver
RUN mkdir build && cd build && cmake .. && make -j$(nproc)

# Ustaw porty
EXPOSE 7171 7172

# Uruchom serwer
CMD ["./build/tfs"]