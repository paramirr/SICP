#lang racket

(define tolerance 0.00001)

(define (average a b)
    (/ (+ a b) 2))

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess count)
        (let ((next (f guess)))
            (display count)
            (display " ")
            (display next)
            (newline)
            (if (close-enough? guess next)
                next
                (try next (+ count 1)))))
    (try first-guess 1))

(let ((dp (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)))
    (newline)
    (display dp)
    (newline)) ; 34번 계산


(let ((dp (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)))
    (newline)
    (display dp)
    (newline)) ; 9번 계산
