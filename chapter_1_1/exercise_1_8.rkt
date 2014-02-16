(module exercise_1_8 racket
    (define (cube-sqrt-iter guess before x)
        (if (good-enough? guess before)
            guess
            (cube-sqrt-iter (cube-improve guess x) guess x)))

    (define (cube-improve guess x)
        (/ (+ (/ x guess guess) guess guess) 3))

    (define (good-enough? guess before)
        (< (abs (- guess before)) 0.0001))

    (define (cube-sqrt x)
        (cube-sqrt-iter 1.0 x x))

    (time-apply cube-sqrt '(2))

    (time-apply cube-sqrt '(4))

    (time-apply cube-sqrt '(8))

    (time-apply cube-sqrt '(5432645654))

)
