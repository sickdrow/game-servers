# Use CentOS 8 as the base image
FROM centos:8

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install EPEL repository and necessary packages
RUN dnf install -y epel-release && \
    dnf groupinstall -y "Development Tools" && \
    dnf install -y \
    wget \
    git \
    cmake \
    bzip2 \
    zlib-devel \
    openssl-devel \
    mariadb-devel \
    postgresql-devel \
    libxml2-devel \
    sqlite-devel \
    pcre-devel \
    bzip2-devel \
    unzip \
    curl \
    && dnf clean all

# Set working directory
WORKDIR /opt

# Download the source code
# Replace the URL with the actual source URL from the guide or your own repository
RUN wget https://github.com/otland/forgottenserver/archive/refs/heads/master.zip -O forgottenserver.zip

# Unzip the source code
RUN unzip forgottenserver.zip && rm forgottenserver.zip

# Set working directory to the extracted source code directory
WORKDIR /opt/forgottenserver-master

# Create and enter the build directory
RUN mkdir build && cd build && \
    cmake .. && \
    make && \
    make install

# Expose ports (Adjust as necessary)
EXPOSE 7171 8080

# Command to run the application (adjust to your specific needs)
CMD ["./the-forgotten-server"]