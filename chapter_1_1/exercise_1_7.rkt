(module exercise_1_7 racket
    (define (sqrt-iter-old guess x)
        (if (good-enough-old? guess x)
            guess
            (sqrt-iter-old (improve guess x) x)))

    (define (sqrt-iter guess before x)
        (if (good-enough? guess before)
            guess
            (sqrt-iter (improve guess x) guess x)))

    (define (improve guess x)
        (average guess (/ x guess)))

    (define (average x y)
        (/ ( + x y) 2))

    (define (good-enough-old? guess x)
        (< (abs (- (* guess guess) x)) 0.0001))

    (define (good-enough? guess before)
        (< (abs (- guess before)) 0.0001))

    (define (sqrt-old x)
        (sqrt-iter-old 1.0 x))

    (define (sqrt x)
        (sqrt-iter 1.0 x x))

    (time-apply sqrt-old '(2))

    (time-apply sqrt '(2))

    (time-apply sqrt-old '(5432645654))

    (time-apply sqrt '(5432645654))

    (time-apply sqrt '(1876498272697237278965843658923645937))

)
