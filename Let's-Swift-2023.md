# **Let's Swift 2023 기록**

- 10/13(금) 행사 참여
- 추후 유튜브로 영상 제공이 될 예정
- 현장에서 들으면서 정리해서 내용 정리가 완벽하지 않을 수 있습니다. 🙏🏻

------

## **객체가 함수를 만났을때**

#### When Object met Function ..

- by 권문범님

### **객체지향이란?**

### **객체지향 설계의 목표**

- 코드의 재사용성을 높히고, 설계를 용이하게 하는 것
  - 결과물 : 디자인패턴, 시스템 아키텍쳐 등
  - 변경 단위를 캡슐화, 내부 동작을 몰라도 설계가 쉽도록 지원
  - 추상화를 통해, 내부 동작을 전부 모르더라도, 외부에서 어떤 기능을 수행하는지만 알게 할 수 있음

### **객체지향설계 특징**

- Polymorphism
  - Overloading, Generic 등으로 코드의 재사용성 증대
- Inheritance
  - class 상속, struct + protocol
- Encapsulation
  - Private, fileprivate, public. open
  - 가독성 및 side-effect 감소

### **Example**

- Chain of Responsibility (UIResponder, becomeFirstResponder...)
- Template Method
  - UITableViewDelegate, UICollectionViewDataSource...

### **함수형**

- 변경을 최소화하여 선언적으로 구현, 실행 예측이 쉽도록 지원 (동일 input, 동일 output)

### **Pure Function**

- 같은 입력에는 항상 같은 출력이 나와야 함

### **High-Order function**

- flatMap, map 등...

### **Functor / Monad**

- Optional, Result는 Monad의 일종

### **프로젝트 설계 시 고려할 수 있는 요소**

### **MVVM 객체지향**

- MVVM 구성 요소
  - View (UI, interaction)
  - ViewController (life cycle 관리, view binding)
  - ViewModel (비즈니스 로직 수행, Data flow 가시화)
    - Input, Output을 분리하여 설계 가능
  - Data / Network (비동기 데이터 처리)
    - Task, async await 등을 활용 가능 (데이터 레이싱 문제 방지)
- MVVM 구성 예시
  - ViewController는 ViewModel을 가지고 있다.
  - ViewController에서 ViewModel을 바인딩한다. (RxSwift, Combine 등으로 반응형으로 바인딩 가능, 상태 변화 시 감지
  - interaction 관련 로직을 Interactor로 분리하여 처리할 수 있음

### **POP (Protocol Oriented Programming)**

- 객체 간의 인터페이스 선언, 데이터 타입 추상화

------

## **SwiftUI, 효율적인 개발 방법, 놀이에 관한 이야기**

- by 노경섭 (NCSoft)

### **애플 개발 언어의 과거와 현재**

- 2014년 Swift 언어가 발표되었습니다.
- 2019년 WWDC19에서 SwiftUI가 발표되었습니다.

### **SwiftUI의 강점 및 개선된 work Flow**

- 한 번의 코드 작성으로 모든 애플 플랫폼에서 사용 가능
- 코드 변경 사항을 바로 preview로 확인 가능
- 명령형(Imperative, How) 대신 선언형(Declarative, What) 구문 사용으로 직관적이고 가독성이 좋음
  - 무엇을 할 것인가, 목적에 포커싱이 되어있음
  - Jetpack Compose, React Native, Flutter 등이 선언형 프로그래밍을 사용

### **SwiftUI의 단점**

- 제한된 기능
  - UIKit, AppKit에 비해 상대적으로 제한된 컴포넌트, 기능 제공
- 러닝 커브
  - UIKit, AppKit과 다른 개념으로 개발해야함
- 문서 및 자료 부족
  - UIKit, AppKit에 비해 문서와 자료가 적음 (시간이 지남에 따라 해소될 것임)
- SwiftUI는 iOS13 이상에서만 사용이 가능
  - iOS16을 90%가, iOS15를 8%가 사용 중, SwiftUI로 구현해도 서비스 운영에 문제 없음

### **SwiftUI Animation**

- withAnimation closure(명시적 animation)나 .animation viewModifier(암시적 animation)로 애니메이션을 실행 가능

### **SwiftUI 상태관리**

- SwiftUI에서 Propertywrapper를 많이 사용함
- @StateObject, @ObservabedObject, @EnvironmentObject 등을 사용하여 상태 변경 시, UI가 랜더링 되는 방식으로 개발 가능
- 위와 같은 상태 메커니즘을 사용해서 UI의 자유도 확장 가능

### **SwiftUI Components**

### **Radio**

- Radio는 Binding<T?>를 인자로 받아 생성되며, 내부적으로 RadioStore를 관리

### **Checkbox**

- 내부적으로 @EnvironmentObject로 CheckStore를 관리

### **Fabula 프로젝트**

- 2021년부터 출시, 이후 좋아요, 채팅방 기능 등을 추가하면서 운영 중
- SwiftUI 개발자들이 본인 작품 PR을 하고, 앱으로 사용자 간 소통 가능한 놀이터
- SwiftUI의 한계를 알고 싶어서 기획
- SwiftUI를 사용한 다양한 기능을 공유
  - 그래프, 회선, 애니메이션 등 다양한 시도를 통해 SwiftUI에 대한 다양한 학습을 할 수 있었음
  - SwiftUI의 메커니즘을 이해했음
- 모든 발표 PPT가 SwiftUI로 개발되었습니다.
  - 프레젠테이션 github : https://github.com/jasudev/LETSWIFT23.git

------

## **Swift Macro 어디에 쓰는가?**

- by 김성종 (CJ 올리브영), WWDC 영상, Expand on Swift Macros를 참고했습니다.

### **Swift Macro의 비교 대상**

- Code Snippet Library
  - Snippet 기능을 사용해서 코드 자동완성을 할 수 있음 (Xcode -> Command + Shift + L)
  - 외부에 미리 만들어 놓은 텍스트를 그대로 에디터에 입력해줌
  - 개발자가 직접 불러서 사용해야하는 단점
  - 팀 내부적으로 공유하기 번거로움
- C Macro
  - \#define 으로 매크로 정의 가능
  - 논리 오류가 발생할 가능성이 높음 (버그 발생 가능성 높음)

### **Swift Macro가 하는 일**

- 매크로가 작성된 곳에 코드를 붙여넣어 준다.
- SPM를 이용하여 배포가 가능하다.
  - 팀 내부적으로 공유, 버전관리 재사용에 용이
- 매크로 호출부에서 펼쳐보기 가능(Xcode 15+, 매크로 호출부 우클릭, expand macro), 이걸 복사 붙여넣기도 가능

### **Swift Macro 단점**

- 배경 지식이 필요합니다.

### **Swift Macro 사용방법**

### **Swift Macro 7가지 역할**

- reference : https://github.com/apple/swift-syntax

- @freestanding(expression)

  - # sign으로 불러줄 수 있음

```
let (result, code) = #stringify(17, 25)
debugPrint("result is \\(result), code is \\(code)")
```

- @freestanding(declaration), DeclarationMacro
  - 선언문 Macro
  - 각각의 타입이 규칙이 있을때 사용할 수 있음
- @attached(peer), PeerMacro
  - 선언문 위에 부착해서 사용
- @attached(accessor), AccessorMacro
  - 접근자 매크로
- @attached(memberAttribute), MemberAttributeMacro
  - 프로퍼티를 꾸미는 역할?
- @attached(member), MemberMacro
  - Codable CodingKey를 자동완성해주는 목적으로 사용 가능
- @attached(extension), ExtensionMacro
  - ex) 특정 타입에 대한 Equatable extension 추가

### **Swift Macro의 작성방법**

- Xcode 15 이상에서 작성 가능합니다.
- Swift Package > Swift Macro를 생성
  - 바닐라 기준으로 선언, 실행, 구현, 테스트 타겟이 생성됨
- 선언
- 실행
- 구현
  - Diagnostic : 작성한 코드가 상황에 맞지 않으면 적절한 메시지를 전달하도록 설정할 수 있음
- 테스트
  - XCTestCase를 부모클래스로 상속한 클래스를 선언해서 테스트 가능
  - 테스트 매크로 제공 -> 테스트 대상과 예측 결과를 명시하여 테스트 가능

### **Swift Macro의 사용예시**

- SwiftUI에서 Xcode15부터 #Preview를 사용함
- Observation -> @Observable 을 제공
- 외부 커뮤니티에서는...
  - Swift-Spyable : 부착하면, spy객체를 그대로 만들어줌
- 우리는 어디에 사용해볼 수 있을까요?
  - 팀 컨벤션이 있어서 어디에든 통용되는 Macro를 만들기 어려움
  - Decodable를 사용하기 어려운 DTO의 경우, 혹은 Codable 이전에 구현된 프로젝트 코드들
    - XMLParser, JSONString 등 -> Heritage initializers를 정의하여 활용 (@initFromJSONString)
- 현업에서 Swift Macro를 활용 중이신 것으로 이해했는데, 정의하신 Macro를 도입, 관리하는 방식은 어떤 방식으로 하시는지
- 현업에서 실제 매크로를 활용 중이신지, 현업이나 개인적으로 프로젝트에 활용하시면서 가장 유용함을 느끼셨거나 혹은 도입을 생각중이신 매크로 기능이 있으신지 궁금합니다.

------

## **Tuist, 도입은 했는데, 그래서 Modular Architecture는 어떻게 만들어가면 되나요?**

- by 김우성님

### **Why Tuist?**

- Tuist는 프로젝트 설정을 단순화 해준다.
- 큰 프로젝트의 확장성을 증대시켜준다.
  - 모듈화를 통한 확장을 수월하게 만들어준다.

### **Final Goal - micro Features Atchitectures**

- 마이크로 Features Architectures
- 해당 Architecture는 아래와 같은 5개 타겟을 따른다.
  - Source
  - Interface
  - Tests
  - Testing
  - Example
- 가능한 완벽한 설계를 목표로 하지 않는다.
- 적절한 아키텍쳐를 목표로 한다.
  - Maximizing build caching
  - Module-based development (모듈 기반 개발)
  - Well-extracted dependencies
- 29cm의 구조 고민 (크게 6가지 layer로 구성)
  - App : Final Products
  - App Feature
  - App Context : Shared logics for micro Feature (공유되는 로직들)
  - App Core Layer : Core Logics for workspace
    - Entity : Entity와 같은 모델을 분리해서 여기에서 관리
      - Q. App Core Layer에서 Entity 모듈을 통해 Entity 모델을 관리하신다고 이해했는데, Networking 응답으로 받은 DTO 모델은 어떻게 관리하시는지
        - Networking 모듈에서 DTO를, Service 내에서 DTO Entity 둘을 변환하는 로직과 함께 관리
      - Q. 간혹 네이밍 룰이 없을때 Entity, DTO 이름을 동일하게 지었다가 타입 추론이 안되어서 컴파일에러를 겪어본 경험이 있는데, 모듈 관련해서 사용하고 계시는 네이밍 룰을 고민해보신적 있으신지 궁금합니다.
        - 네이밍 룰은 필요하다고 봅니다. Entity 모델 명을 보다 구체적으로 두고, DTO는 prefix, suffix등으로 특정 키워드를 붙이는 방식으로 가면 좋을 것 같습니다.
    - Networking : Moya
    - Service, Resources
    - Design System
  - Shared
    - Third Parties : 기반이 되는 기능 ex) Amplitude, Braze, Firebase, Naver, Kakao 등...
    - Foundations : 외부 라이브러리들

### **Starting micro Features Atchitectures**

- 쉬워보이는 기능 부터 분리를 시작했다.
  - 설정관련 부분을 Settings 모듈로 분리
- 모듈화를 하면서 개발하다보면 다른 모듈 간에 있어서 서로가 서로의 화면을 표시해야하는 경우, Circular Dependency가 발생하는 경우가 있을 수 있다.
  - Abstract ViewController Factory 개념으로 인터페이스 추상화를 통해서 해결

### **One more thing for micro feature architecture**

- 모듈 단위 Feature App을 만들어서 빠른 빌드 시간으로 빠르게 기능을 확인할 수 있다.

### **Summarize**

- Design modularization milestone first
- Focus on maximiszing build caching
- Aim for appropriate architecture
- Build ... gradually

------

## **iOS 애플리케이션 개발 생산성 고찰, 정시 퇴근을 위해. 우리는 어떻게 해야할 것인가?**

### **iOS 개발의 병목 현상 분석**

- 외부 요인
  - 기획 시나리오 변경
  - 디자인 변경
  - 서버작업 진행 중 오동작
    - 서버작업 문제로, 개발 진행이 힘들어지는 경우
    - 서버작업이 잘 안되어 상상코딩 하는 경우도 있음
  - 과거 코드 이슈
    - 기존 작성했던 코드가 오래 방치되어있는 경우, 코드 이해 및 개발을 이어나가는데 어려움이 있음
  - 회의
- 내부 요인
  - 긴 피드백 사이클
  - 빌드 시간
  - 실행 시간 (로그인하고, 서버 설정하고 등등의 절차로 시간이 소요됨)
  - 테스트

### **어떻게 생산성을 향상할 수 있을까?**

### **보통 실행 및 동작확인이 가장 오래걸림...**

- 대부분의 서비스는 서버 데이터를 기반으로 앱이 동작함 (일반적으로 로그인, 페이지 이동 간에 많은 네트워킹이 필요함)

### **작업 환경 개선 방법**

- View 계층구조 보기 확장
  - Xcode의 Debug View Hierarchy 를 통해서 뷰 계층구조 확인 가능
    - but, 프로세스를 일시정지 시키고 확인하는 단점이 있음
  - Lookin, Reveal 등을 활용해서 View 디버깅이 가능
    - Lookin : 오픈소스, 무료, 프로세스 중지를 시킬 필요 없이 실시간으로 뷰 계층 구조를 확인 가능
    - Reveal : 상용 소프트웨어, 유료(14-day free trial 가능)
- 콘솔 로그 확장
  - 일반적으로 Xcode의 콘솔 로그를 통해 로그를 확인
  - Xcode15에서는 특정 로그를 구분하기 쉬운 옵션을 제공함
  - Pulse, Proximal 등을 활용할 수 있음
    - Pulse : Request, Response 등의 기록을 외부 창으로 쉽게 확인 가능
    - Proxyman : 대표적인 네트워크 캡쳐 도구
      - Q. instrument 와 큰 차이점이 있을지? : Proxyman이 개발환경을 해치지 않는 선에서 효율적으로 활용 가능하다고 봅니다.
- 런타임 코드 제어
  - 일반적으로 LLDB를 이용해서 디버깅 할 수 있음
  - Xcode의 Debug Memory Graph, Debug View Hierarchy 활용
  - break point 잡힌 상태, 일시정지 버튼 클릭
    - pvc를 사용하면, 쌓여진 계층 구조, 각각의 View에 대한 메모리 주소를 확인 가능
    - LLDB를 잘 활용하면, pvc를 통해 특정 viewController 메모리 주소를 확인하고, 접근 하여 속성을 바꿀 수 있음
- Hot Reload
  - 코드 변경 시. ㅐ플리케이션이 즉시 적용해서 생산성을 높이는 방식
    - ex) SwiftUI의 Preview
    - Preview를 사용할 수 없다면, **johnno1962/injection3** 를 활용할 수 있음

### **전체적인 개발 생산성 관점 접근 방식**

- 작업 환경의 최적화
  - 적절한 방법 및 도구 사용
  - 최소한의 빌드 및 실행으로 검증
- 프로젝트 규모 축소
  - 다른 기능 간의 결합을 최소화
  - 모듈 분리
  - 모듈의 데모앱을 활용해서 빠르게 기능동작 확인
  - 모듈 별 테스트코드 수행
  - Tuist, XcodeGen, SwiftPM, CocoaPods등 활용 가능
    - Modular Architecture 관점에서 고민하기

### **마치며**

- Xcode 개발 환경에서 조금만 벗어나보면 어떨까?
  - 우리가 제어하면 어떨까
- 코드 작성 후 빠르게 기능을 확인하려면 어떻게 해야할까?

------

## SwiftUI 레이아웃과 데이터 플로우 이해하기

## **SwiftUI 데이터 플로우**

### **top down**

StateObject 값을 상수, @Binding, @ObservableObject 등으로 받아 사용 기능

EnvironmentOject를 사용해서 global하게 데이터를 사용 가능

- 사용 전에 EnvironmentKey를 추가한다
- 주입받은 하위뷰에서만 사용하려면 viewModifier 방식으로 사용할 수도 있음

### **bottom up**

- PreferenceKey, onPreferenceChange 를 사용해서 하위뷰의 변회를 상위뷰에서 감지할 수 있음

### **Summary**

- SwiftUI View
  - Layout process
  - Sizing Behaviors
  - Frame Modifier
- DataFlow
  - dynamic property

------

## **Path to Swift**

- Swift가 프로그램이 되기까지 by 라이노(조수환님)

### **Introduction**

- 기기는 특정한 기계어만 이해할 수 있습니다. ex) arm64 등...
- 프로그램은 디바이스에 어떻게 돌아야할지 명령하는 것
  - 금융회사를 다닌다면, 입금, 출금 기능 등을 요구할 수 있음
- 기기와 기계어 사이 사이를 연결하기 위해 사용되는 것이 swift같은 프로그래밍 언어이다.

### **Swift**

- 기존 애플 플랫폼에서 cpp, objective-C등의 직계 후손이다.
- 하지만 문법적 큰 차이가 있다.
- swift언어는 안전하기만 성능적으로 빠른 언어 지향한다.
- swift언어는 LLVM 기반으로 만들어져있다.
  - frontend, backend로 분리되어있으며, frontend에서 swift로 만들면, LLVM IR을 backend로 넘겨주고, backend에서 기계어를 만들게 되는 형태

### **Swift 컴파일 과정**

### **Module**

- 여러개의 모듈이 합해져서, 하나의 앱이 됨, 그만큼 모듈을 어떻게 설계하느냐는 중요합니다.
- 모듈들을 묶어서 하나로 만드는 과정을 Linking 이라고 합니다.
- swift 컴파일러가 마지막 시점에 linker를 호출하여 linking을 해준다.
- 컴파일 타임에 swift driver가 동작한다. (Xcode 13부터 swift로 구성이 되어서 찾아보면 오픈소스 확인 가능)
- Front end의 작업은 병렬적으로 동작할 수 있으며, 각각의 작업들은 중복 작업을 하지 않는다. (각자 고유한 작업이 할당된다)
- Whole Module : 모든파일을 컴파일 하는 방식
- Batch : Whole Module, Single방식의 중간지점을 맞춘 방식 (현재 기본 방식)
- Single : 모두가 하나씩만 컴파일 하는 방식

### **Swift 컴파일 과정**

- parse
  - 컴파일 시 Swift 파일은 구문 분석을 통해서 AST(추상 구문 트리)를 생성한다.
    - Swift-Syntax -> swift로 만들어진 것
- Sema
  - AST를 만들었으면, AST가 정상적인지 검사를 함
  - Swift는 강타입언어이므로, 구조적인 검사를 통해 AST에 정보를 채워서 다음단계로 넘긴다.
    - C언어는 위에서 읽어서 쭉 내려오면서 읽을 수 있다. (위에서 선언을 하므로), 반면 Swift는 선언이 나오기 전에 사용할 수도 있고, C언어와 같은 선언방식이 아닐 수 있다. 이런것들을 체계화하기 위해서 Swift 4.2에서 Request Evaluator를 사용한다. (일반화된 parsing 방법)
    - Briding header를 통해 swift, objective-c 등을 함께 embeding할 수 있다.
  - 선언과 정의를 찾아서, 컴파일러가 이해시키는 과정을 거친다. (Name Lookup)
- SIL jam (Swift Intemediate Language)
  - Swift와 LLVM IR의 중간지점에 해당
  - 만들어둔 AST를 Raw SIL로 만들어줌
- RawSIL
  - 최적화를 진행함. (빠진 변수가 있다던가...)
- Canonical SIL
  - 성능 최적화를 진행화 후, 다음 단계로 넘어감
- IRGam
  - Canonical SIL를 LLVM IR로 넘긴다.
- LLVM IR
  - LLVM Backend -> 기계어로 넘긴다.

### **Conclusion**

- 위와 같은 많은 단계를 통해서 swift언어로 구성된 파일을 컴파일 해서 기계어로 전달하고, 프로그램이 안전하게 돌아갈 수 있도록 해준다.
- 위의 과정을 모두 알아야한다고 생각하지는 않는다. 하지만, 위와 같은 이론을 알아두냐에 따라 버그가 발생하거나 할때 대처할 수 있는 방향은 다양해질 수 있다.

### **QnA**

- 위와 같은 정보들은 어디에서 확인하는 편인가요?
  - Swift Revolution을 자주 본다.
- 컴파일 시간 최적화를 위해 할 수 있는 노력이 있다면 무엇이 있을까요?
  - 컴파일이 느린지 파악
  - 모듈 간의 의존성이 적도록 설계
  - 위의 컴파일 단계와 관련해서 제공되는 옵션을 활용
