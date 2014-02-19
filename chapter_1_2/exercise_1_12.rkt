(module exercise_1_12 racket
    (define (pascal c r)
            (if (or (= c 1) (= c r))
                1
                (+ (pascal (- c 1) (- r 1)) (pascal c (- r 1)))))

    (pascal 1 6)
    (pascal 2 6)
    (pascal 3 6)
    
)
