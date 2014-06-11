#lang racket

(define (cont-frac n d k)
    (define (iter result count)
        (if (= 0 count)
            result
            (iter (/ (n count) (+ (d count) result)) (- count 1))))
    (iter 0 k))

(+ 2 (cont-frac (lambda (i) 1.0)
           (lambda (i) (if (= (remainder (+ i 1) 3) 0) (/ (* 2 (+ i 1)) 3) 1.0))
           100))
