# 빌드 환경을 코드로 고정합니다. (누가, 어디서 빌드해도 같은 컴파일러/도구 버전)
FROM ubuntu:24.04

# C++ 컴파일러, CMake, make 설치
RUN apt-get update \
    && apt-get install -y --no-install-recommends g++ cmake make \
    && rm -rf /var/lib/apt/lists/*

# 소스 코드는 실행 시 /src 로 마운트됩니다.
WORKDIR /src

# 버전은 환경변수 APP_VERSION 으로 받습니다. (없으면 dev)
CMD ["bash", "-c", "cmake -S . -B build -DAPP_VERSION=${APP_VERSION:-dev} && cmake --build build"]
