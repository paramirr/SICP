## 프로시저를 만드는 프로시저

  * 프로시저를 프로시저의 결과 값으로 돌려줄 수 있으면 언어의 표현력이 강화됨
  * 계산 방식 중 공통된 부분을 추출하여 추상화할 수 있음

### 뉴튼 방법

  * 1.1.7에서 썼던 방법과 다른 방법 사용

  * 미분되는 함수 g(x) 의 근은 다음 함수 f(x)의 정점

![equation](http://latex.codecogs.com/gif.download?f%28x%29%20%3D%20x%20-%20%5Cfrac%7Bg%28x%29%7D%7B%7Bg%28x%29%7D%27%7D)

  * 뉴튼 방법을 프로시저로 나타내려면 미분의 정의를 프로시저로 표현해야 함

![equation](http://latex.codecogs.com/gif.download?%7Bg%28x%29%7D%27%20%3D%20%5Cfrac%7Bg%28x+dx%29-g%28x%29%29%7D%7Bdx%7D)

  * 다음과 같은 방식으로 미분된 프로시저를 반환하는 프로시저를 만들 수 있음
```racket
(define (deriv g)
    (define dx 0.00001)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x)) dx)))
```

  * 위 코드를 이용해 뉴튼법을 다음과 같이 작성할 수 있음
```racket
(define (newton-transform f)
    (lambda (x) (- x (/ (f x) ((deriv f) x)))))

(define (newton-method f guess)
    (fixed-point (newton-transform f) guess))
```

### 요약(abstraction) 과 일등급 프로시저(first-class procedure)

  * lisp에서는 프로시저를 받아 다른 프로시저로 변환할 수 있음
    * 이를 통해 일반적인 계산 방법을 그대로 표현할 수 있음

  * 프로시저를 일등급 시민(first-class citizen)으로 다루어야 이런 방식을 사용할 수 있음

  * 일등급 시민(first-class citizen) 이란?
    * 일반적으로 다른 개체(entity)에서 실행할 수 있는 모든 동작이 허용된 개체
    * expression에 등장하거나,
    * 변수에 할당되거나,
    * 프로시저의 인자로 쓰일 수 있다.
    * 언어 별로 일등급 시민이 되는 개체는 다르다.
      * http://en.wikipedia.org/wiki/First-class_citizen 참조
    * lisp에서는 함수가 일등급 시민

  * 자유 변수(free-variable) 이란?
    * 프로시저에서 쓰이는 변수 중 파라미너나 지역 변수가 아닌 것
    * 예를 들면,
      * 전역 변수
      * (클래스 멤버 프로시저의 경우) 멤버 변수
      * 클로저 변수 (http://en.wikipedia.org/wiki/Closure_%28computer_science%29 참고)
    * 어떤 방식으로든 함수를 값으로 넘겨주는 언어의 경우
      * 함수를 반환하는 함수에서 자유 변수를 위한 기억 공간을 저장하고 있어야 함
      * racket 실행기의 경우 프로시저의 환경(enviroment)속에 클로저 변수를 위한 기억 장소가 있음

  * 함수가 일등급 시민인 언어의 경우 속도 면에서 다소 불리하다는 것이 통설
    * ...이었으나 VM으로 언어를 바이트 코드 등으로 변환하는 것이 가능해지면서 속도 차이가 많이 줄어듬
    * LLVM 컴파일러를 통해 구현한 pypy의 경우 cPython보다 빠른 현상이 나타남(!)

