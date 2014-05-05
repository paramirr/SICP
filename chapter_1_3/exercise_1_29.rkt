#lang racket

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-h x)
    (+ x (* 2 h)))
  (* (/ h 3) 
     (+ a 
        b 
        (* 4 (sum f (+ a h) add-h (- b h)))
        (* 2 (sum f (+ a (* 2 h)) add-h (- b (* 2 h)))))))

(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(integral-simpson cube 0 1 100) ; 정확히 1/4이 나온다.
(integral-simpson cube 0 1 1000) ; 위와 마찬가지

(integral square 0 1 0.01)
(integral square 0 1 0.001)
(integral-simpson square 0 1 100) ; 정확히 1/3이 나온다.
(integral-simpson square 0 1 1000) ; 위와 마찬가지

