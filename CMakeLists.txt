cmake_minimum_required(VERSION 3.10)
project(patch_pipeline CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 빌드할 때 -DAPP_VERSION=v1.0.0 처럼 버전을 넘길 수 있음 (기본값 dev)
set(APP_VERSION "dev" CACHE STRING "Application version")

add_executable(patch_pipeline main.cpp)
target_compile_definitions(patch_pipeline PRIVATE APP_VERSION="${APP_VERSION}")
