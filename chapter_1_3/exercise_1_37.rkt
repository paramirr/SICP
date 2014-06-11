#lang racket

(define (cont-frac n d k)
    (define (iter result count)
        (if (= 0 count)
            result
            (iter (/ (n count) (+ (d count) result)) (- count 1))))
    (iter 0 k))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ; 11번이 0.6180 까지 계산한다.

(define (cont-frac-recur n d k)
    (define (recur i)
        (if (= i k)
            (/ (n i) (d i))
            (/ (n i) (+ (d i) (recur (+ i 1))))))
    (recur 1)
)

(cont-frac-recur (lambda (i) 1.0)
                 (lambda (i) 1.0)
                 11) ; 11번이 0.6180 까지 계산한다.
