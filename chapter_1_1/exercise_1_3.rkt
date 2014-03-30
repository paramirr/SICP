(module exercise_1_3 racket
    (define (square x)
        (* x x))
    (define (square-big x y)
        (if (> x y) (square x) (square y)))

    (define (square-and-sum-big-two x y z)
        (cond ((or (> x y) (> x z)) (+ (square x) (square-big y z)))
              ((or (> y x) (> y z)) (+ (square y) (square-big x z)))
              (else (+ (square z) (square-big x y)))))

    (= (square-and-sum-big-two 1 2 3) 13)
    (= (square-and-sum-big-two 3 2 3) 18)
    (= (square-and-sum-big-two 4 3 2) 25)
)
