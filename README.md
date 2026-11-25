# patch-pipeline

게임 라이브 서비스 시절, 주간 패치를 "수동 로컬 빌드 → 바이너리 직접 전달" 방식으로 처리하며 느꼈던
한계(빌드 환경 불일치, 이슈-빌드 추적의 수동 관리, 전달 이력/롤백 관리)를
CI/CD로 해결해 보는 미니 프로젝트입니다.

## 목표

- [x] 로컬에서 빌드되는 C++ 프로그램
- [ ] Docker로 빌드 환경 고정 (누가 빌드해도 같은 결과)
- [ ] GitHub Actions로 태그 push 시 자동 빌드
- [ ] Release에 버전이 붙은 바이너리와 변경 내역 자동 첨부

## 로컬 빌드

```bash
cmake -S . -B build -DAPP_VERSION=v0.1.0
cmake --build build
./build/patch_pipeline
```

## 진행 기록

| 날짜 | 내용 |
|---|---|
| 11/25 | 프로젝트 생성, 로컬 빌드 확인 |
