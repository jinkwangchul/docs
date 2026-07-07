# Docs GitHub Repository Prep Report 2026-07-07

## 1. 목적

현재 docs 폴더를 GitHub 저장소로 관리하기 위한 준비 상태를 점검하고, Git 포함/제외 기준과 초기 커밋 구성을 제안한다.

이번 작업은 코드 수정이 아니다.

이번 작업에서 수행하지 않은 일:

- 기존 문서 수정 없음
- 파일 삭제 없음
- 파일 이동 없음
- Python 코드 수정 없음
- kiwoom_auto 수정 없음
- runtime 수정 없음
- rules.json 수정 없음
- 압축파일 생성 없음
- Git commit 없음
- Git push 없음
- GitHub repository 생성 없음

## 2. 현재 폴더 구조 점검

확인된 주요 구조:

```text
docs/
  00_CANONICAL/
    CURRENT/
    CHANGELOG/
    TRACE/
    OPEN_ISSUES/
  10_UPDATE/
    INBOX/
    MERGED/
    TEMPLATE/
  20_ARCHIVE/
  30_REPORTS/
  90_TEMP/
```

추가로 확인된 과거/로컬 구조:

```text
10_UPDATE_QUEUE/
20_SOURCE_ARCHIVE/
30_CODEX_WORK/
90_UNSORTED/
MASTER_SPEC_v2.5_REBUILD_WORKSPACE/
MASTER_SPEC_v3.0_BASELINE_/
MASTER_SPEC_v4.0/
마스터스펙/
마스터스펙정리/
프로젝트폴더백업/
```

판단:

- 핵심 운영 구조는 존재한다.
- 과거 구조와 로컬 백업 구조가 함께 남아 있다.
- GitHub Source of Truth 저장소에는 Canonical, Update, Reports, 운영 표준을 우선 포함하는 것이 적합하다.

## 3. 용량 점검

스캔 기준:

- 전체 일반 파일: 1611개
- 전체 용량: 약 151.54 MB
- 압축파일: 46개, 약 76.65 MB
- 압축 제외 용량: 약 74.89 MB

폴더별 주요 용량:

| 위치 | 파일 수 | 용량 |
|---|---:|---:|
| `00_CANONICAL` | 21 | 49.12 MB |
| `10_UPDATE` | 2 | 0.01 MB |
| `20_ARCHIVE` | 1464 | 10.73 MB |
| `30_REPORTS` | 6 | 2.01 MB |
| `90_TEMP` | 89 | 1.91 MB |
| `마스터스펙정리` | 10 | 12.25 MB |
| `프로젝트폴더백업` | 3 | 75.07 MB |

대형 백업 zip:

| 파일 | 용량 |
|---|---:|
| `프로젝트폴더백업/kiwoom_auto (37).zip` | 18.43 MB |
| `프로젝트폴더백업/kiwoom_auto (38).zip` | 23.30 MB |
| `프로젝트폴더백업/kiwoom_auto (58).zip` | 33.34 MB |

예상 저장소 크기:

- 모든 파일 포함 시 약 151.54 MB
- zip 제외 시 약 74.89 MB
- 권장 ignore 적용 시 약 73 MB 수준으로 예상

## 4. Git 포함 권장

GitHub Source of Truth에 포함 권장:

- `README.md`
- `.gitignore`
- `00_CANONICAL/`
- `10_UPDATE/`
- `20_ARCHIVE/` 중 압축파일을 제외한 문서 자료
- `30_REPORTS/`
- `AI_PROJECT_OPERATION_MANUAL_*.md`
- `DOCS_FOLDER_OPERATION_STANDARD_*.md`
- `DOCS_LIFECYCLE_STANDARD_*.md`
- `DOCS_FOLDER_CLEANUP_CANDIDATE_REPORT_*.md`
- 루트의 최신 참조 문서 중 아직 정리되지 않은 문서

포함 사유:

- Canonical과 CHANGELOG는 docs 저장소의 핵심 Source of Truth이다.
- UPDATE는 향후 병합 대기 흐름의 공식 입력이다.
- 운영 매뉴얼과 docs 표준은 협업 절차의 기준이다.
- REPORTS는 정리/병합/검토 이력을 보존한다.

## 5. Git Ignore 권장

Git ignore 권장:

- `*.pyc`
- `__pycache__/`
- `Thumbs.db`
- `Desktop.ini`
- `.DS_Store`
- `.pytest_cache/`
- `.mypy_cache/`
- `.ruff_cache/`
- `.cache/`
- `*.tmp`
- `*.temp`
- `*.bak`
- `*.swp`
- `90_TEMP/`
- `90_UNSORTED/`
- `10_UPDATE_QUEUE/`
- `20_SOURCE_ARCHIVE/`
- `30_CODEX_WORK/`
- `프로젝트폴더백업/`
- `*.zip`
- `*.7z`
- `*.rar`

판단:

- 90_TEMP는 검토 대상이지 Source of Truth가 아니다.
- 과거 중간 구조는 현재 운영 구조와 중복되므로 초기 GitHub 업로드에서는 제외를 권장한다.
- 압축파일은 저장소 크기를 급격히 키우므로 GitHub repository 본문보다 로컬 보관 또는 별도 release/storage가 적합하다.

## 6. Local 전용 권장

Local 전용 권장:

- `.agents/`
- `.codex/`
- `.git/`
- `프로젝트폴더백업/`
- 임시 캐시
- 90_TEMP 검토 중 파일

판단:

- 로컬 도구 상태와 백업 zip은 GitHub Source of Truth에 직접 포함하지 않는 편이 좋다.
- TEMP 파일은 cleanup candidate 보고서로 추적하고, 검토 후 필요한 문서만 Canonical/Archive/Reports로 승격한다.

## 7. 용량이 큰 백업 zip

백업 zip은 Git 포함보다 Local 전용 또는 별도 보관을 권장한다.

확인된 백업 zip:

- `프로젝트폴더백업/kiwoom_auto (37).zip`
- `프로젝트폴더백업/kiwoom_auto (38).zip`
- `프로젝트폴더백업/kiwoom_auto (58).zip`

정책:

- 삭제하지 않는다.
- 이동하지 않는다.
- GitHub 초기 커밋에는 포함하지 않는 것을 권장한다.
- 필요 시 별도 백업 저장소, release asset, 외부 보관소를 검토한다.

## 8. .gitignore 초안

`.gitignore`를 신규 생성했다.

주요 포함 내용:

- OS 잡파일
- Python cache
- 로컬 Codex/agent metadata
- TEMP/UNSORTED
- 과거 중간 구조
- zip/7z/rar 압축파일
- 프로젝트 백업 zip 폴더

## 9. README 초안

`README.md`를 신규 생성했다.

포함 내용:

- 프로젝트 목적
- MASTER_SPEC 운영 방식
- CURRENT 사용법
- UPDATE 사용법
- CHANGELOG 정책
- ARCHIVE 정책
- 새 대화 시작 시 참조 순서
- GitHub 운영 원칙

## 10. GitHub 초기 커밋 구성 제안

초기 커밋 메시지 제안:

```text
Initial docs repository
```

초기 커밋 구성:

```text
README and gitignore
Canonical documents
Operation manuals
Update pipeline
Archive policy
Cleanup policy
Reports
```

권장 commit 포함:

- `README.md`
- `.gitignore`
- `00_CANONICAL/`
- `10_UPDATE/`
- `20_ARCHIVE/` 단, 압축파일 제외
- `30_REPORTS/`
- 운영 매뉴얼
- docs 운영 표준
- cleanup/lifecycle 보고서

권장 commit 제외:

- `프로젝트폴더백업/`
- `*.zip`
- `90_TEMP/`
- `90_UNSORTED/`
- 로컬 캐시와 도구 metadata

## 11. 향후 Codex 참조 시 장점

장점:

- GitHub 최신 docs를 문서 Source of Truth로 사용할 수 있다.
- ChatGPT가 GitHub 기준으로 MASTER_SPEC, 운영 매뉴얼, UPDATE, CHANGELOG를 직접 분석하기 쉬워진다.
- Codex는 로컬 문서 수정과 보고에 집중할 수 있다.
- Canonical 갱신 흐름과 UPDATE 병합 흐름이 안정화된다.
- 백업 zip과 TEMP를 제외하면 저장소가 가벼워지고 검색성이 좋아진다.

## 12. 최종 확인

생성한 파일:

- `.gitignore`
- `README.md`
- `DOCS_GITHUB_REPOSITORY_PREP_REPORT_2026-07-07.md`

수행하지 않은 작업:

- 기존 문서 수정 없음
- 파일 삭제 없음
- 파일 이동 없음
- Git commit 없음
- Git push 없음
- GitHub repository 생성 없음
- Python 코드 수정 없음
- kiwoom_auto 수정 없음
- runtime 수정 없음
- rules.json 수정 없음
- 압축파일 생성 없음
