# Use an Ubuntu base image as a substitute for Gentoo
FROM ubuntu:22.04

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages and dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    wget \
    git \
    unzip \
    libssl-dev \
    libmysqlclient-dev \
    libsqlite3-dev \
    libpq-dev \
    libxml2-dev \
    zlib1g-dev \
    libbz2-dev \
    libpcre3-dev \
    libcurl4-openssl-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt

# Download the source code
# Replace this URL with the actual source code URL
RUN wget https://github.com/otland/forgottenserver/archive/refs/heads/master.zip -O forgottenserver.zip

# Unzip the source code
RUN unzip forgottenserver.zip && rm forgottenserver.zip

# Set working directory to the extracted source code directory
WORKDIR /opt/forgottenserver-master

# Create and enter the build directory, configure and build the project
RUN mkdir build && cd build && \
    cmake .. && \
    make && \
    make install

# Expose necessary ports
EXPOSE 7171 8080

# Command to run the application
CMD ["./the-forgotten-server"]