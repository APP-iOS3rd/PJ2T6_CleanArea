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


### 소개 영상

- [유튜브 - 청정구역 시연 영상](https://youtu.be/S1xxq8XBxU8)

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
[![The Composable Architecture](https://img.shields.io/badge/TheComposableArchitecture-1.9.2-brown)]()

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

- 23.12.05 ~ 23.12.07
    - 팀빌딩
    - 아이디어 선정 및 피그마 디자인 제작
    - 시작화면, 상세화면 UI구현
    - 정책데이터 XML로 받아와서 저장
    - 즐겨찾기 기능 구현
    - 메인 화면 UI 구현
    - 화면 이동 로직 구현

</details>

<details>
<summary>Step 2 타임라인</summary>

- 23.12.10 ~ 23.12.11
    - 검색 filter 기능 추가
    - 추천 화면 UI 구현
    - API filter 기능 구현
    - 추천정책 UI 구현
    - 정책 분리 기능 구현
    - 웹 뷰 구현
    - 운영기간내용으로 디데이와 진행상태 표시하는 기능 구현    

- 23.12.12
    - 메인화면 리스트 셀 구현
    - 즐겨찾기부분 SwiftData연동
    - 뒤로가기 기능 구현
    - 로딩화면 구현
    - 전체 API값 호출하도록 수정
</details>

<details>
<summary>Step 3 타임라인</summary>

- 23.12.13 ~ 23.12.14
    - XML데이터를 바로 받아오던 로직에서 DB에 저장 후 데이터를 가공 후 JSON 데이터를 받아오게 수정
    - 시 이미지 파일 및 코드 추가
    - 취업여부, 학력선택창 "전체선택" 제거
    - post방식으로 조회수 증가 기능 구현
    - Font파일 추가
    - 코드 리팩토링, 폰트 / 패딩값 통일
    - launchScreen추가, 앱 Icon 추가
</details>

<details>
<summary>Step 4 타임라인</summary>

- 24.03.18
    - TCA 라이브러리 설치
    - 코드 컨벤션 수정
- 24.03.25
    - StartView TCA 패턴 적용 
        - StartView -> StartFeature
        - StartTextField -> TextFieldFeature
        - startLocation -> LocationFeature
        - 각 리듀서별로 Test코드 작성
- 24.03.27 ~ 24.03.31
    - Start-Main-List 화면이동 구현
        - path에 스토어 추가하고 제거하는 로직 적용
    - Detail, Main TCA 아키텍처 적용
- 24.04.01
    - 더미데이터로 작업 중이던 부분들 서버데이터로 변경
- 24.04.02
    - 즐겨찾기 SwiftData를 리듀서에서 처리하는 로직 구현
        - DetailView 오픈 시 서버에 데이터 전송로직 구현
- 24.04.03
    - TCA 패턴 적용 완료
    - StartFeature 테스트 코드 추가
    - MainFeature 테스트 코드 추가
    - ListFeature 테스트 코드 추가
    - ListItemFeature 테스트 코드 추가
    - DetailFeature 테스트 코드 추가
   
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
<details>
<summary>연동 관련</summary>

### 1. 문제 정의

- “입력화면”에서 각 조회조건을 입력하고 “추천 정책 화면”으로 넘어갈때, 조건에 맞는 필터링이 되지않음
- “입력화면”에서 “추천 정책 화면”으로 넘어갈때, 로딩이 김
- “추천 정책 세부 화면”에서 D-Day 날짜를 적어야하는데, 날짜 계산이 안됨
- “청정구역”에서 조회수 data를 웹서버에 보냈지만 응답없음
- 정부API 정책 데이터가 수정되면 자동으로 DB 데이터를 업데이트하고 싶음

### 2. 사실 수집

- 주거지 : 성남시, 취업상태: 제한없음, 학력: 제한없음, 나이: 20 입력
    - 경기도 주관부처가 실시하는 정책이 나오지 않음
    - 취업상태가 제한없음 이라면, 고등학교 졸업도 나와야하는데 나오지않음
    - 학력도 마찬가지
    - 나이 입력시 나이에 맞는 정책이 나오지 않음
- “추천 정책 세부” 화면에 D-Day 데이터 계산되지않는다.
- “청정구역”에서 조회수 data post중 웹서버에서 받아오지못함
- 정부API 정책 데이터를 수동으로 DB에 저장중

### 3. 원인추론

- API에서 제공되는 엘리멘트마다 데이터 형식이 다 다르다.
    - ex)
        - 나이 : “39세 미만”, “19이상 ~ 39세미만”
        - 날짜 : “2023.01 ~ 2023.12”, “상시진행”, ”2023.01.01 ~ 2023.12”
- 조회수 data post중에 데이터 형식이 jsonData로 보내짐
- 정부API 정책 데이터를 수동하게 코딩해놓음

### 4. 조사방법 결정

- 정부 API Server 데이터가 일관성이 없기에, REST API, 네트워크 통신, Server, DB 구조 조사
- JsonData로 받는법 조사
- 웹서버에서 자동으로 정부데이터가 업데이터 되는법 조사

### 5. 조사 방법 구현

- 정부 API 데이터를 가공할 WebServer 구현후 이곳에서 “청정구역”에 필요한 데이터를 줌
- 정부 API 데이터를 저장할 DataBase 구현
- express.json()을 사용하여 json형식으로 받아오게 구현
- 정부 API 정책이 추가될때마다 변경해야되기에 Data Pooling 구현
    - setInterval 메소드 사용하여 5시간에 한번씩 받아오도록 구현

### 6. 결과 관찰

- WebServer에서 정부API 데이터 가공 하여 DB 저장
    - 나이 : “39세 미만” ⇒ “0” ~ “39”
    - 날짜 : “YYYYMMDD” ~ “YYYYMMDD” 수정 및 특정데이터 “상세확인” 변경
- “청정구역”에서 요청한 데이터 형식에 맞게 가공 확인
- json형식으로 받아오게 구현 완료
- 5시간마다 정부API데이터가 DataBase에 저장
</details>

<details>
<summary>즐겨찾기 기능 문제</summary>
    
### 1. 문제 정의

- 여러 페이지에서 즐겨찾기 버튼시 연동되지 않는 문제 확인

### 2. 사실 수집

- 즐겨찾기 기능 저장은 되나 추천, 인기, 상세 화면에서 즐겨찾기 기능 해제시 즐겨찾기 페이지에서 해당 정책이 사라지지 않음
- 일부 정책은 즐겨찾기 페이지서 중복됨

### 3. 원인 추론

- SwiftData에서 공유되는 데이터가 일치하지 않음
- SwiftData에서 공유되는 데이터를 같은 데이터로 인식하지 않음

### 4. 조사방법 결정

- SwiftData 모델에 Attribute속성을 추가해 unique한 변수를 만들어 주기

### 5. 조사 방법 구현

- SwiftData 모델을 수정한 뒤 @Query를 사용하여 List데이터를 만든다.
- 각 페이지(추천, 인기, 상세)에서 즐겨찾기로 추가한다음 해당 페이지가 아닌 다른 페이지에서 즐겨찾기를 해제한다.

### 6. 결과 관찰

- 해당 방법을 적용후 데이터가 연동되지 않는 문제 해결
</details>

<details>
<summary>TCA패턴으로 적용하며 생겼던 문제들</summary>

### 1. 문제 정의

- 네비게이션을 이용한 뷰 이동이 제대로 작동되지 않던 오류

### 2. 사실 수집

- StartView에서 MainView로의 이동은 되는데 그 MainView안에 있는 탭뷰 아이템들에서 새로 네비게이션이 열리지 않음

### 3. 원인 추론

- TCA아키텍처에서는 네비게이션 패스가 선언되어있는 스택안에서 새로운 네비게이션 스택을 생성하는게 불가능함

### 4. 해결방법

- 최상위 스토어에서 스택을 쌓을 수 있는 Path를 생성
- 이동할 화면을 Path에 추가하고 dismiss로 Path에서 제거하는 방식으로 네비게이션 구현

### 해결 코드 
- ### 리듀서
    - `State`: 네비게이션을 위한 경로 상태를 관리. StackState<Path.State>를 사용하여 현재 네비게이션 스택을 추적
    - `Action`: openMain 액션은 메인 화면으로의 경로를 추가하는 데 사용. path 액션은 네비게이션 스택의 변경을 관리
    - `body`: openMain 액션을 받았을 때, 메인 화면으로의 경로를 네비게이션 스택에 추가하여 네비게이션 상태 변경


```Swift
@Reducer
struct StartFeature {
    @ObservableState
    struct State: Equatable {
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case openMain
        case path(StackAction<Path.State, Path.Action>)
    }

    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
           
            case .openMain:
                // Main 화면으로의 경로를 path 스택에 추가합니다.
                state.path.append(.mainScene(MainFeature.State(
                    policies: state.result
                )))
                return .none
                
            case let .path(action):
                // Path 액션을 처리합니다. 여기서는 화면 전환 로직을 추가할 수 있습니다.
                switch action {
                default:
                    return .none
                }
            }
            
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
}

extension StartFeature {
    @Reducer
    struct Path {
        @ObservableState
        enum State: Equatable {
            case mainScene(MainFeature.State)
        }
        
        enum Action {
            case mainScene(MainFeature.Action)
        }
        
        var body: some ReducerOf<Self> {

            Scope(state: \.mainScene, action: \.mainScene) {
                MainFeature()
            }
        }
    }
}
```

- ### 뷰
    - `NavigationStack`: TCA의 NavigationStack을 사용하여, 스토어의 상태를 바탕으로 동적으로 화면을 전환      
        - path 파라미터에 바인딩된 스토어의 상태를 통해 네비게이션 스택을 관리
    - `destination`: 경로 상태에 따라 표시할 화면을 결정
        - 예를 들어, 상태가 .mainScene일 때 MainView를 표시

```Swift
NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                VStack {
                    // 화면 구성
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            } destination: { store in
                switch store.state {
      
                    
                case .mainScene:
                    if let store = store.scope(state: \.mainScene, action: \.mainScene) {
                        MainView(store: store)
                    }
                }
            }
```

</details>




