(module exercise_1_16 racket
    (define (fast-expt-iter b n)
        (define (even? x)
            (= (remainder x 2) 0))
        (define (iter a n)
            (cond ((= n 0) a)
            ((even? n) (iter (* a a) (/ n 2)))
            (else (iter (* a b) (- n 1)))))
        (if (= n 0) 1
            (iter b (- n 1)))
    )

    (fast-expt-iter 3 20)
    (fast-expt-iter 2 10)

)
