# Użyj oficjalnego obrazu Ubuntu jako bazowy
FROM ubuntu:22.04

# Zaktualizuj system i zainstaluj wymagane pakiety
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    cmake \
    make \
    g++ \
    libboost-all-dev \
    libpugixml-dev \
    liblua5.2-dev \
    libgmp-dev \
    libssl-dev \
    libcrypto++-dev \
    libsqlite3-dev \
    zlib1g-dev \
    pkg-config \
    libmariadb-dev \
    libmariadb-dev-compat \
    libfmt-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Skopiuj kod źródłowy The Forgotten Server
RUN git clone https://github.com/otland/forgottenserver.git /forgottenserver

# Skopiuj konfiguracje i skompiluj serwer
WORKDIR /forgottenserver
RUN mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc)

COPY config.lua /forgottenserver/config.lua


# Ustaw porty
EXPOSE 7171 7172

# Uruchom serwer
CMD ["forgottenserver"]