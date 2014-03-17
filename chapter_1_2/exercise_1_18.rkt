(module exercise_1_18 racket
    (define (double x)
        (+ x x))
    (define (halve x)
        (/ x 2))
    (define (even? x)
        (= (remainder x 2) 0))
    (define (mul a b)
        (define (iter r d i)
            (cond ((= i 0) r)
                  ((even? i) (iter r (double d) (halve i)))
                  (else (iter (+ r d) d (- i 1)))))
        (iter 0 a b))

    (mul 3 2)
    (mul 4 5)

)
