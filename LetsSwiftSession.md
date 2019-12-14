
<br>
<br>

# Let's Swift 

- Let's Swift 세미나 내용

<br>

## Animation Looper

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

### forEach

- For0in-loop와 유사한 동작
- loop와 달리 중간에 종료 불가

~~~ swift 
["This","is","Spatal!"].forEach {
      print("\($0)")
}

~~~

### filter

- 조건에 부합하는 요소(Element)들을 걸내기 위한 함수 

### first

- 조건에 해당하는 처음 요소 혹은 마지막 요소를 가져오는 함수 



### reduce

- 모든 요소들을 이용해서 하나의 최종결과를 만들어내는 함수 



### map

- 원래의 요소들을, 같거나 다른 Typedml dythfh qusghks(Transform) 하는 함수

### flatMap

- map + flatten 시킨 결과물을 반환 

~~~ swift 
[[1,2,3], [3,4,5], []]
.flatMap { (numberList) -> [Int] in 
         return numberList.map {#0 * #0}}
// [1,2,9,16,25,36]
~~~

- flatMap in Optional
  -     변환(Transform) 실패에 대응



### Monad

- 값(Value)를 담은 Context로 되어있고, flatMap function을 지원하는 것 



### compactMap

- flatMap에 이어 compactMap이 분리된 이유 
  - context의 타입이 바퀴는 것이 이상함 



* tip) 뛰어난 개발자는 소통능력이 뛰어나다 

forEach, filter, first/last(where:), reduce
map, flatMap, compactMap



## Functor, Monad

### container (혹은 Context / Wrapper) 

- Array, Dictionary, REsult, Optional 등 
- Functor는 map
- Monad는 flatMap
