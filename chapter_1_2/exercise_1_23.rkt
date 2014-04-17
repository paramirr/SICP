#lang racket

(define (square x)
    (* x x))

(define (divides? a b)
    (= (remainder b a) 0))

(define (next x)
    (if (= x 2) (+ x 1)
                (+ x 2)))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (find-divisor-fast n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor-fast n (next test-divisor)))))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (smallest-divisor-fast n)
    (find-divisor-fast n 2))

(define (looped-prime? n count)
    (if (= n (smallest-divisor n)) (cond ((> count 0) (looped-prime? n (- count 1))) (else #t))
        #f))

(define (fast-looped-prime? n count)
    (if (= n (smallest-divisor-fast n)) (cond ((> count 0) (fast-looped-prime? n (- count 1))) (else #t))
        #f))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (start-prime-test n start-time)
    (if (looped-prime? n 1000)
        (report-prime (- (current-inexact-milliseconds) start-time))
        #f))

(define (start-prime-fast-test n start-time)
    (if (fast-looped-prime? n 1000)
        (report-prime (- (current-inexact-milliseconds) start-time))
        #f))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (current-inexact-milliseconds)))

(define (timed-prime-fast-test n)
    (newline)
    (display n)
    (start-prime-fast-test n (current-inexact-milliseconds)))

(define (search-for-primes n c)
    (cond ((= c 3) (newline) (display "end.") (newline))
          ((divides? 2 n) (search-for-primes (+ n 1) c))
          ((timed-prime-test n) (search-for-primes (+ n 2) (+ c 1)))
          (else (search-for-primes (+ n 2) c))))

(define (search-for-primes-fast n c)
    (cond ((= c 3) (newline) (display "end.") (newline))
          ((divides? 2 n) (search-for-primes-fast (+ n 1) c))
          ((timed-prime-fast-test n) (search-for-primes-fast (+ n 2) (+ c 1)))
          (else (search-for-primes (+ n 2) c))))

(display "slow prime start")
(search-for-primes 1000 0)
(search-for-primes 10000 0) 
(search-for-primes 100000 0) 
(search-for-primes 1000000 0) 

(newline)
(display "fast prime start")
(search-for-primes-fast 1000 0)
(search-for-primes-fast 10000 0) 
(search-for-primes-fast 100000 0) 
(search-for-primes-fast 1000000 0) 

; 두 경우의 차이가 거의 나지 않는다.
; next를 + 대신 쓸 경우, 함수를 부르는 숫자는 반으로 줄지만 부를 때마다 2인지 검사하기 때문에 실행 회수는 같다.
