# 🐳 청정구역
청년들을 위한 정책을 알려주는 청정구역

## 📖 목차
1. [소개](#🌱-소개)
2. [개발환경 및 라이브러리](#💻-개발환경-및-라이브러리)
3. [기대효과](#✨-기대효과)
4. [기능설명](#📢-기능-설명)
5. [동작원리](#💡동작-원리)
5. [타임라인](#⏰-타임라인)
6. [실행화면](#📱-실행-화면)
7. [트러블슈팅](#❓-트러블-슈팅)


## 🌱 소개
### 앱 목적
- 청년들의 성공을 위한 국가정책 제공
- 너무 복잡하고 많은 청년 정책들을 일일히 찾아보기 어려운 청년들에게 알맞는 청년정책 추천

### 타겟 사용자
- 20 ~ 30대 청년 ( 일상에 치여 청년 정책을 알아볼 시간이 없는 청년들 )

### 🧑🏻‍💻 팀원
|[최동호](https://github.com/hamfan524)|[김건호](https://github.com/GeonH0)|[김지훈](https://github.com/Jihunkim95)|[노주영](https://github.com/JooYoungNoh)|[이민호](https://github.com/funMango)|
|-----------|-----------|-----------|------------|------------|
|<img src="https://user-images.githubusercontent.com/96968834/212670363-ae5dbf8f-dc1a-41b2-a08e-21a6f5f345b1.jpg" width="100">|<img src="https://avatars.githubusercontent.com/u/88571960?v=4" width="100">|<img src="https://avatars.githubusercontent.com/u/112596655?v=4" alt="Kakao-Talk-Photo-2023-09-19-15-30-11" width="100">|<img alt="1f" src="https://avatars.githubusercontent.com/u/96951827?v=4" width="100">|<img src="https://avatars.githubusercontent.com/u/138420832?v=4" width="100">|

### ✨ 기대효과

```
- 알지 못했던 정책들을 알려줘서 사용자들이 필요한 정보를 제공할 수 있다.

- 정책의 기간을 알려줘서 마감일 전에 사용자들이 신청할 수 있게 도와준다.

- 사용자들이 정책을 매번 검색할 필요없이 즐겨찾기하여 시간을 줄일 수 있다.
```

### 📢 기능설명

```
- 개인의 주거 지역, 취업 상태, 나이, 학력, 관심 정책 키워드를 바탕으로 청년 정책을 검색

- 해당되는 일자리, 주거, 교육, 복지•문화,  참여•권리 분야의 정책 정보를 제공

- 키워드를 바탕으로 검색한 정책들 중 사용자들이 가장 많이 찾는 정책을 보여줌

- 사용자가 즐겨찾기한 정책을 다시 검색할 필요 없이 바로 이동이 가능

- 다크 모드 지원
```

## ⚙️ 개발 환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.9.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-15.0.1-blue)]()

## 💡동작 원리
![qwewqewqewq](https://github.com/APP-iOS3rd/PJ2T6_CleanArea/assets/37105602/321f5e04-f740-4005-a40f-b71d8140e457)

- WebServer에서 정부 APIServer에 데이터를 요청한 후 수신된 XMLData를 가공합니다.
- WebServer에서 가공된 데이터를 MySQL로 구축된 DB에 저장합니다.
- 사용자의 iOS 기기에서 쿼리문을 설정하여 URL를 요청하면 WebServer에서 해당 쿼리문에 맞는 데이터를 DB에서 찾은 후 JSONData를 송신해서 사용자들에게 정보를 제공합니다.

### 🪡 순서도
<img width="478" alt="스크린샷 2023-12-13 오후 3 07 09" src="https://github.com/APP-iOS3rd/PJ2T6_CleanArea/assets/37105602/ff6b192d-0194-4589-bbaa-d1bd94ceb2bf">


### 🧑‍🔧 데이터 베이스 설계
`데이터 저장 및 관리 방안`
- SwiftData를 사용해 사용자가 즐겨찾기한 정책 보관
- Express.js를 사용해 WebServer를 구축
- WebServer에서 HTTP 통신을 사용하여 정부API 데이터, DB에 저장 
- Data Pooling을 이용하여 지속적으로 정부API를 DB 업데이트
- ‘청정구역’, ‘정부API Server’, ‘WebServer’ ,‘MySQL’ 데이터 연동
- Express.js를 사용해 WebServer를 구축 한 후 URL 요청

## ⏰ 타임라인

<details>
<summary>Step 1 타임라인</summary>
</details>

<details>
<summary>Step 2 타임라인</summary>
</details>

<details>
<summary>Step 3 타임라인</summary>
</details>

<details>
<summary>Step 4 타임라인</summary>
</details>

## 📱 실행 화면
|앱 실행|시작화면|
|:--:|:--:|
|<img src="https://github.com/APP-iOS3rd/PJ2T6_CleanArea/assets/37105602/9cd85595-8df8-46b9-99f1-e7896dfefdd1" width="300">|<img src="https://github.com/APP-iOS3rd/PJ2T6_CleanArea/assets/37105602/b64a1bd7-d75a-4308-8dae-8c2822f44d72" width="300">|

|메인화면|상세화면|
|:--:|:--:|
|<img src="https://github.com/APP-iOS3rd/PJ2T6_CleanArea/assets/37105602/c706b976-9147-4789-8137-3aa7869b2514" width="300">|<img src="https://github.com/APP-iOS3rd/PJ2T6_CleanArea/assets/37105602/4419be43-5a2b-4fda-bd99-a5e1b798679f" width="300">|

|웹뷰열기|즐겨찾기|
|:--:|:--:|
|<img src="https://github.com/APP-iOS3rd/PJ2T6_CleanArea/assets/37105602/1024e99d-fa85-44d0-88f4-017d1068d248" width="300">|<img src="https://github.com/APP-iOS3rd/PJ2T6_CleanArea/assets/37105602/f2ab802c-dd72-4095-95a7-52ab56f6e87a" width="300">|

## ❓ 트러블 슈팅
