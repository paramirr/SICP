#lang racket

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))


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

(integral-simpson cube 0 1 100) ; 정확히 1/4이 나온다.
(integral-simpson cube 0 1 1000) ; 위와 마찬가지

