





# Let's Swift 

- Looper() 를 통한 애니메이션 처리를 할 수 있음.
- 애니메이션 순차처리 또한 looper를 활용할 수 있다. 

~~~ swift 

var res1: Response!: var res2: Response!
loooper.invoke { dsl in 
               fetch1 { r in res1 = r}
               dsl.isInfinity = true
                dsl.block = P item in 
                if res1 != nil ....
               .....
               }
~~~

<br>

- Flow - async Tasking
  - Flow의 클래스 선언 

~~~ swift
Flow()
.async { sync in
       // start가 불리면 즉시 실행되는 영역
       fetch1 { r in  // 페치가 끝나고 sync가 불려지면, section1.render를 실행 후 빠져나간다. 
             // 순차 보장 처리 
         		 sync {section1.render(with: r)}}
       }
.async { sync in
       // start가 불리면 즉시 실행되는 영역
       fetch2 { r in 
             // 순차 보장 처리 
         		 sync {section1.render(with: r)}}
       }
.start()
~~~

~~~swift


/// flow 클래스의 구현
class Flow {
  private class Block {
    static let TypeAsync = "async"
    var type: String
    let body: Any
    init(type: String, body: Any) {
      self.type = type
      self.body = body
    }
  }
}...

/*
class Flow {
  private class Block {
    
  }
}
*/
// 어려운 주제라 잘 이해못함.. ㅠ.ㅠ
~~~

<br>


## 최완복님 세션, 함수형 프로그래밍 
- Lets Swift 2019 실용적인 함수형 프로그래밍 워크샵
- 인지도 복잡도 점수
  - 인지적 복잡도를 수치화한 개념
  - -SonarQube의 지표 중 하나.
  - 규칙
    - 심리적인 복잡도의 증가는 좋은코드를 짜지 못하게 한다. 
    - for, if 등이 있을때마다 점수가 추가, 콜백hell / if else 파동권.. 등을 만날때마다 nesting점수가 쌓인다.



순수함수(Pure Function) 
  - 동일한 input에 동일한 output, 부작용 없음

익명함수(Anonymous function)
...

#### forEach

- For0in-loop와 유사한 동작
- loop와 달리 중간에 종료 불가

~~~ swift 
["This","is","Spatal!"].forEach {
  	print("\($0)")
}

~~~

#### filter

- 조건에 부합하는 요소(Element)들을 걸내기 위한 함수 

#### first

- 조건에 해당하는 처음 요소 혹은 마지막 요소를 가져오는 함수 



#### reduce

- 모든 요소들을 이용해서 하나의 최종결과를 만들어내는 함수 



#### map

- 원래의 요소들을, 같거나 다른 Typedml dythfh qusghks(Transform) 하는 함수

#### flatMap

- map + flatten 시킨 결과물을 반환 

~~~ swift 
[[1,2,3], [3,4,5], []]
.flatMap { (numberList) -> [Int] in 
         return numberList.map {#0 * #0}}
// [1,2,9,16,25,36]
~~~

- flatMap in Optional
  - ​	변환(Transform) 실패에 대응



#### Monad

- 값(Value)를 담은 Context로 되어있고, flatMap function을 지원하는 것 



#### compactMap

- flatMap에 이어 compactMap이 분리된 이유 
  - context의 타입이 바퀴는 것이 이상함 



* tip) 뛰어난 개발자는 소통능력이 뛰어나다 

forEach, filter, first/last(where:), reduce
map, flatMap, compactMap



### Functor, Monad

#### container (혹은 Context / Wrapper) 

- Array, Dictionary, REsult, Optional 등 
- Functor는 map
- Monad는 flatMap



<br>



### 스타일쉐어의 업무환경

- 전수열, ... 

#### 업무환경은 ? 

- 개발자에게 의사결정을 할 수 있는 기회이자 자유, 책임을 부여함 
  - 입사 직후에도 업무 내의 선택에 대한 권한 존재 
  - 하고 싶은 것을 해볼 수 있는 문화 
  - TDD 기반 개발을 해보겠다 할 때 누군가 막고 하는 건 없음 (약간 trade off 개념일지 모름)
  - 자유(자율성)와 책임이 공존하는 체계 

- 코드리뷰가 존재, 

#### 업무 상 프로세스는?

- PR이 옳라오면 일단은 리뷰가 되는 상태여야 함 
- 어떻게 클래스를 설계했는지 하나하나 PR에 기록, gif등의 움짤까지 활용하여 PR에 설명 
- 커밋의 주기는?
  - 얼마나 부담없이 PR을 다른 사람이 볼 수 있는가를 고려 
  - ex) 버튼을 누를때 상태가 변경 되는 등의 자잘한 변경사항
  - 리뷰받기 쉬운 PR이 무엇인지 고민한다. 
- 브랜치 정책 
  - 특정 릴리즈 브랜치에 대해 나누어 PR을 작성 후 마스터브랜치와 관리
    - 릴리즈는 보통 1달 주기로 릴리즈를 실시
  - 다섯명의 개발자가 각자 기능을 개발해서 릴리즈 하는데, 실질적으로 배포가 가능하기 전까지는 개발 브랜치에서 커트할 수 있도록 (각자 개발브랜치를 관리, 상황에 따른 마스터와의 교류)
  - 동시에 4~5명이 개발하더라도 실제 테스트하는 브랜치는 하나이므로 실질적으로 충돌이 날 일이 없음

#### 업무 상 습관

- JSY : 6개월~2년 뒤에라도 다시 이해할 수 있도록 상세하게 코드 설명을 작성 
- JSY : 혼자 일하면서 몰아서 정리하는 습관을 갖다 보니까 그 과정에서 잘게 쪼개지 않으면 난해한 상황이 오는 것을 경험, 그런 경험을 토대로 최대해 리뷰어가 보기 쉽게 커밋, PR할 수 있도록 노력하고 있음 
- 개발자2 : 기획 관련 스펙들을 테스트케이스를 포함하여 기록 
  - 어떠한 원인, 원리로 구현되는지를 PR뿐만 하니라 코드만 봐도 이해하기 쉽도록 고민
- JSY : 업무 하다보면 git rebase -i를 많이 쓰게 됨..
- JSY : Pure, ReactorKit, testable 독자적 라이브러리를 사용(개인 레포지토리에 존재)
  - 스타일쉐어 입사 3년차 즈음 ReactorKit을 개발 