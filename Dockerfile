# syntax=docker/dockerfile:1
FROM sebmilardo/py-osrm:latest

# OR Tools
RUN mkdir -p /opt/or-tools && cd /opt/or-tools && \
      git clone --depth 1 -b stable https://github.com/google/or-tools src && \
      cd src && mkdir build && \
      cd build && \
      cmake -DBUILD_DEPS=ON .. && \
      make && \
      make install && rm -rf /opt/or-tools

# Update ldconfig
RUN ldconfig
