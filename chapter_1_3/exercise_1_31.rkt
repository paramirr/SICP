#lang racket

(define (product term a next b)
  (if (> a b)
    1
    (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1)) ; b. iterative process


(define (factorial n)
  (define (as x)
    x)
  (define (inc x)
    (+ x 1))
  (product-iter as 1 inc n))

(factorial 10)

(define (approx-pi-fourth fomula-count)
  (define (get-numer x)
    (+ 2 (* 2 (floor (/ x 2)))))
  (define (get-denom x)
    (+ 3 (* 2 (- (ceiling (/ x 2)) 1))))
  (define (inc x)
    (+ x 1))
  (/ (product get-numer 1 inc fomula-count)
     (product get-denom 1 inc fomula-count)))

(define (get-numer x)
    (+ 2 (* 2 (floor (/ x 2)))))
(define (get-denom x)
    (+ 3 (* 2 (- (ceiling (/ x 2)) 1))))
(define (inc x)
    (+ x 1))

; 실제 pi/4는 약 0.7853981633974483096156608458198757210492923498437764 (from wolfram alpha)

(exact->inexact (approx-pi-fourth 100)) ; 0.7892575441137919
(exact->inexact (approx-pi-fourth 1000)) ; 0.7857901763830666
(exact->inexact (approx-pi-fourth 10000)) ; 0.7854374264345131

