(module exercise_1_11 racket
    (define (recursive-proc n)
        (if (< n 3) n
            (+ (recursive-proc (- n 1)) (* 2 (recursive-proc (- n 2))) (* 3 (recursive-proc (- n 3))))))

    (define (iterative-proc n)
        (define (iter a b c x)
                (if (< x 3)
                    c
                    (iter b c (+ c (* 2 b) (* 3 a)) (- x 1))))
        (if (< n 3) 
            n
            (iter 0 1 2 n)))

    (recursive-proc 2)
    (iterative-proc 2)

    (recursive-proc 3)
    (iterative-proc 3)

    (recursive-proc 4)
    (iterative-proc 4)

    (recursive-proc 5)
    (iterative-proc 5)

    (recursive-proc 6)
    (iterative-proc 6)

    (recursive-proc 7)
    (iterative-proc 7)
)
