FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    cmake \
    make \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build _build

RUN mkdir -p /home/logs && chmod 777 /home/logs

ENV LOG_PATH=/home/logs/log.txt
VOLUME /home/logs

WORKDIR /app/_build/solver_application
ENTRYPOINT ["./solver_app"]