## 1.3.3 일반적인 방법을 표현하는 프로시저

* 계산 자체를 procedure로 요약할 수 있음

* High-order procedure를 만들어 요약한 procedure를 인자로 받을 수 있음
  * 계산하는 방법만 뽑아낼 수 있음

### 이분법으로 방정식 근 찾기

* 함수 f가 연속일 때 f(x)=0 의 근 찾기

* f(a) < 0 < f(b) 인 a, b가 있을 때 a와 b 사이에 f(x)=0 인 x가 있음

* a 와 b의 평균점 m에 대한 f(m)을 구하여 범위를 좁혀 나가는 방식
  * f(m) > 0 일 경우 a, m 사이에서 근을 찾음
  * f(m) < 0 일 경우 m, b 사이에서 근을 찾음

* 계산 종료 조건
  * a 와 b의 간격이 일정 수치 이하일 경우
  * 책에서는 0.001 사용 중
  * 컴퓨터의 숫자 표현방법 한계와 알고리즘에 따라 수치가 달라질 수 있음

* 계산 복잡도
  * abs(b - a) 를 T 라 할 때, T를 일정 수치(k) 이하로 줄여야 함
  * 한 번 할 때마다 범위가 반으로 줄어듬
  * 복잡도는 O(log(T/k))

### 고정점 찾기

* 고정점
  * f(k) = k인 k
  * 예를 들어, f(x) = x^2 일 경우 1이 고정점

* 고정점을 찾는 방법
  * f(k) 를 새 k로 삼아 다음 f(k)를 구하는 방법
  * f(f(k)), f(f(f(k)))... 식으로 구한다

* 고정점을 찾을 수 없는 경우
  * 특정한 함수의 경우 함수 단독으로는 고정점을 찾을 수 없다
  * 예) 1/x 의 경우 f(y1) = 1/y1, f(1/y1) = y1
  * 이럴 경우 x와 f(x)의 평균을 구하는 방법으로 고정점을 구한다
  * 이 방법을 average damping이라고 한다
