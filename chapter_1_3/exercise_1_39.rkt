#lang racket

(define (square x) (* x x))

(define (cont-frac n d k)
    (define (iter result count)
        (if (= 0 count)
            result
            (iter (/ (n count) (+ (d count) result)) (- count 1))))
    (iter 0 k))

(define (tan-cf x k)
    (cont-frac (lambda (i) (if (= i 1) x (- (square x))))
               (lambda (i) (+ 1 (* (- i 1) 2)))
               k))

(tan-cf (/ pi 6) 10)
(tan (/ pi 6))
(tan-cf (/ pi 4) 10)
(tan (/ pi 4))
(tan-cf (/ pi 3) 10)
(tan (/ pi 3))
