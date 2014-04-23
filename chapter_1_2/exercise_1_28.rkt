#lang racket

(define (square x)
  (* x x))

(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))
                (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (expmod base k m)
  (cond ((= k 0) 1)
        ((even? k) (square-check (expmod base (/ k 2) m) m))
        (else (remainder (* base (expmod base (- k 1) m)) m))))

(define (miller-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-test n) (fast-prime? n (- times 1)))
        (else #f)))

(fast-prime? 17 10) ; true
(fast-prime? 561 10) ; false
(fast-prime? 1105 10) ; false
(fast-prime? 1729 10) ; false
(fast-prime? 2465 10) ; false
(fast-prime? 2821 10) ; false
(fast-prime? 6601 10) ; false
