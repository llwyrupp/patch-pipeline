#include <iostream>

// CMake가 빌드 시점에 APP_VERSION 값을 주입합니다.
// (나중에 Git 태그 이름이 이 값으로 들어가도록 CI에서 연결할 예정)
#ifndef APP_VERSION
#define APP_VERSION "dev"
#endif

int main() {
    std::cout << "patch-pipeline version: " << APP_VERSION << std::endl;
    return 0;
}
