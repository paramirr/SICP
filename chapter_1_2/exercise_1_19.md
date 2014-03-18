![equation](http://latex.codecogs.com/gif.latex?T%28p%2C+q%29)를 두 번 실행하면 다음과 같다.

![equation](http://latex.codecogs.com/gif.latex?a%5Cleftarrow%28bp%2Baq%29q%2B%28bq%2Baq%2Bap%29q%2B%28bq%2Baq%2Bap%29p)

위 식을 다음과 같은 형식으로 조정할 수 있다.

![equation](http://latex.codecogs.com/gif.latex?a%5Cleftarrowb%28q%5E2%2B2pq%29%2Ba%28q%5E2%2B2pq%29%2Ba%28q%5E2%2Bp%5E2%29)

그러므로 ![equation](http://latex.codecogs.com/gif.latex?p%5Cbackprime) 와 ![equation](http://latex.codecogs.com/gif.latex?q%5Cbackprime) 의 값은 다음과 같다.

![equation](http://latex.codecogs.com/gif.latex?p%5Cbackprime%3Dq%5E%7B+2+%7D%2B2pq%5Cquad%2Cq%5Cbackprime%3Dq%5E2%2Bp%5E2)

이에 따라, 프로시저 정의의 빈 부분은 다음과 같다.

<code>
(+ (* q q) (* 2 p q))
(+ (* q q) (* p p))
</code>
