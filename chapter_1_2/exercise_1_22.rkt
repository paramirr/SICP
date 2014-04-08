(module exercise_1_22 racket
    (define (square x)
        (* x x))

    (define (divides? a b)
        (= (remainder b a) 0))

    (define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
              (else (find-divisor n (+ test-divisor 1)))))

    (define (smallest-divisor n)
        (find-divisor n 2))

    (define (prime? n)
        (= n (smallest-divisor n)))

    (define (report-prime elapsed-time)
        (display " *** ")
        (display elapsed-time))

    (define (start-prime-test n start-time)
        (if (prime? n)
            (report-prime (- (current-inexact-milliseconds) start-time))
            #f))

    (define (timed-prime-test n)
        (newline)
        (display n)
        (start-prime-test n (current-inexact-milliseconds)))

    (define (search-for-primes n c)
        (cond ((= c 3) (newline) (display "end.") (newline))
              ((divides? 2 n) (search-for-primes (+ n 1) c))
              ((timed-prime-test n) (search-for-primes (+ n 2) (+ c 1)))
              (else (search-for-primes (+ n 2) c))))

    (search-for-primes 1000 0) ; 약 4 microseconds
    (search-for-primes 10000 0) ; 약 6 microseconds
    (search-for-primes 100000 0) ; 약 20 microseconds
    (search-for-primes 1000000 0) ; 약 40 microseconds

    ; (root 10) 은 약 3.16이다. 
    ; 자리수마다 3.16배 이하의 차이가 났다.
    ; 1000에서 1000000 까지의 증가 속도가 10 배임을 볼 때, (log n) 에 더 가깝다.
)

