#lang racket

(define (square x)
    (* x x))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) #t)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else #f)))

(define (loop-fast-prime? n c)
    (if (fast-prime? n 100) (if (> c 0) (loop-fast-prime? n (- c 1)) #t)
                             #f))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (start-prime-test n start-time)
    (if (loop-fast-prime? n 1000)
        (report-prime (- (current-inexact-milliseconds) start-time))
        #f))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (current-inexact-milliseconds)))

(define (search-for-primes n c)
    (cond ((= c 3) (newline) (display "end.") (newline))
          ((even? n) (search-for-primes (+ n 1) c))
          ((timed-prime-test n) (search-for-primes (+ n 2) (+ c 1)))
          (else (search-for-primes (+ n 2) c))))

(search-for-primes 1000 0)
(search-for-primes 10000 0) 
(search-for-primes 100000 0) 
(search-for-primes 1000000 0) 

; 1000과 1000000의 차이는 약 2배 정도 난다.
; 테스트하는 숫자의 개수가 같으므로, 차이가 거의 없을 수 있다.
