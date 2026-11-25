# patch-pipeline

게임 라이브 서비스 시절, 주간 패치를 "수동 로컬 빌드 → 바이너리 직접 전달" 방식으로 처리하며 느꼈던
한계(빌드 환경 불일치, 이슈-빌드 추적의 수동 관리, 전달 이력/롤백 관리)를
CI/CD로 해결해 본 미니 프로젝트입니다.

## 문제와 해결

| 기존 방식의 문제 | 이 프로젝트에서의 해결 |
|---|---|
| 개발자 PC마다 환경이 달라 빌드 결과가 달라질 수 있음 | Dockerfile로 빌드 환경 고정 |
| 사람이 직접 빌드하고 전달 | Git 태그 push 시 GitHub Actions가 자동 빌드 |
| 어떤 이슈가 어떤 빌드에 들어갔는지 수동 추적 | 커밋 로그로 변경 내역을 자동 생성해 Release에 첨부 |
| 전달 이력과 롤백이 개인 관리에 의존 | 버전별 Release로 이력 보관, 이전 버전 바이너리 재다운로드 가능 |

## 구조

```
태그 push (v0.1.0)
  → GitHub Actions 실행
  → Docker 이미지로 빌드 환경 생성
  → 컨테이너 안에서 빌드 (태그 이름이 버전으로 포함)
  → 실행해서 버전 검증
  → 이전 태그 이후 커밋으로 변경 내역 생성
  → Release에 바이너리 + 변경 내역 업로드
```

## 로컬에서 Docker로 빌드

```powershell
docker build -t patch-builder .
docker run --rm -e APP_VERSION=v0.1.0 -v "${PWD}:/src" patch-builder
```

## 릴리즈 방법

```bash
git tag v0.1.0
git push origin v0.1.0
```

## 진행 기록

| 날짜 | 내용 |
|---|---|
| 11/25 | 프로젝트 생성, Docker 빌드 환경, GitHub Actions 릴리즈 파이프라인 구성 |
