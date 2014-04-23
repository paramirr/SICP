#lang racket

(define (square x)
  (* x x))

(define (expmod base k m)
  (cond ((= k 0) 1)
        ((even? k) (remainder (square (expmod base (/ k 2) m)) m))
        (else (remainder (* base (expmod base (- k 1) m)) m))))

(define (test a n)
  (cond ((= a 1) #t)
        ((= a (expmod a n n)) (test (- a 1) n))
        (else #f)))

(define (carm-test n)
  (test (- n 1) n))

(carm-test 17) ; 소수. #t가 나온다.
(carm-test 18) ; 소수 아님. #f가 나온다.
(carm-test 561) ; 이후는 Carmichael numbers. 모두 소수가 아니지만 #t 가 나온다.
(carm-test 1105)
(carm-test 1729)
(carm-test 2465)
(carm-test 2821)
(carm-test 6601)
