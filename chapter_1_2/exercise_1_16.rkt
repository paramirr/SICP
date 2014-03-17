(module exercise_1_16 racket
    (define (fast-expt-iter b n)
        (define (even? x)
            (= (remainder x 2) 0))
        (define (iter r d k)
            (cond ((= k 0) r)
                  ((even? k) (iter r (* d d) (/ k 2)))
                  (else (displayln k) (iter (* r d) d (- k 1)))))
        (cond ((= n 0) 1)
              (else (iter 1 b n)))
    )

    (fast-expt-iter 3 7)
    (fast-expt-iter 2 11)

)
