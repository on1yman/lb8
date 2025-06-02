FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc g++ cmake make \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build _build

WORKDIR /app/_build/solver_application
ENTRYPOINT ["./solver_app"]