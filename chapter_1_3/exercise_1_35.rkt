#lang racket

; 황금비를 p라 할 경우, p^2 = p + 1, p = 1 + 1/p 가 되어 f(x) = 1 + 1/x 의 고정점이 된다.

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

