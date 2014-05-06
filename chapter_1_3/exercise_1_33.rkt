#lang racket

(define (filtered-accumulate combiner null-value filter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (cond ((filter a) (iter (next a) (combiner result (term a))))
            (else (iter (next a) result)))))
  (iter a null-value))

(define (square x)
  (* x x))

(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))
                (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (expmod base k m)
  (cond ((= k 0) 1)
        ((even? k) (square-check (expmod base (/ k 2) m) m))
        (else (remainder (* base (expmod base (- k 1) m)) m))))

(define (miller-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (prime? n)
  (fast-prime? n 100))

(define (inc x)
  (+ x 1))

(define (prime-square-sum start end)
  (filtered-accumulate + 0 prime? square start inc end))

(prime-square-sum 2 10)

(define (as x)
  x)

(define (rel-prime-product n)
  (define (rel-prime? x)
    (= (gcd x n) 1))
  (filtered-accumulate * 1 rel-prime? as 1 inc n))

(rel-prime-product 10)
