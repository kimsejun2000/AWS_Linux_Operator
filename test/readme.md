# Coscom 교육 자료
이 자료는 LearningClue에서 의뢰하여 **클라우드 사용자를 위한 리눅스 시스템관리**라는 주제로 Coscom에서 시행하는 교육의 실습 자료입니다. 교육기간이 끝나면 이 자료는 파기되며, 지속 보존을 원하시는 분 께서는 아래에 [git cli를 사용하여 repository 복제하기](#git_cli를_사용하여_repository_복제하기) 순서에 따라 별도의 `git repository`에 복제를 하는 것을 추천한다.

이 문서는 AWS Account가 생성되어 있다는 전제 하에 작성되었다.

## 자료 탐색
이 문서는 다음과 같은 경로를 가진다.
- `Example`: 예제 모음. `.ppt` 문서에서 나오는 **실습**에 대한 내용을 다룬다.
- `Source`: Source 저장소
- `Image`: 이미지 저장소

## git cli를 사용하여 repository 복제하기
1. [git-scm.com](https://git-scm.com/downloads)에 접속하여 운영체제에 맞는 git client를 설치한다.

2. 각 운영체제의 CLI 명령창(Bash 또는 명령 프롬프트)를 실행한다.

3. 현재 Repository를 복제할 폴더를 생성하고, 위치를 이동한다.

4. 다음 명령어를 이용하여 git clone으로 repository를 client에 복제한다.
    ```bash
    git clone https://kimsejun@bitbucket.org/kimsejun/coscom_linuxsystem_management.git
    ```