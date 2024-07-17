FROM ubuntu:22.04 AS build
RUN apt-get update && apt-get install -y \
  build-essential \
  libboost-all-dev \
  cmake \
  libfmt-dev \
  libluajit-5.1-dev \
  libmariadb-dev \
  libssl-dev \
  libpugixml-dev

COPY cmake /usr/src/forgottenserver/cmake/
COPY src /usr/src/forgottenserver/src/
COPY CMakeLists.txt CMakePresets.json /usr/src/forgottenserver/
WORKDIR /usr/src/forgottenserver
RUN cmake --preset default -DUSE_LUAJIT=ON && cmake --build --config RelWithDebInfo --preset default

FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
  libfmt7 \
  libluajit-5.1-2 \
  libmariadb3 \
  libssl1.1 \
  libpugixml1.11

COPY --from=build /usr/src/forgottenserver/build/RelWithDebInfo/tfs /bin/tfs
COPY data /srv/data/
COPY *.dist *.sql key.pem /server/

EXPOSE 7171 7172
WORKDIR /server
VOLUME /server
ENTRYPOINT ["/bin/tfs"]