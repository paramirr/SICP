맞바꿈 계산과정일 경우 계산 과정은 다음과 같다.

```
    (gcd 206 40)

    (if (= 40 0)
        206
        (gcd 40 (remainder 206 40)))
    (gcd 40 (remainder 206 40))

    (if (= (remainder 206 40) 0)
        40
        (gcd (remainder 206 40)
             (remainder 40 (remainder 206 40))))

    (if (= 6 0) ;; remainder 프로시저 1 회 실행
        40
        (gcd (remainder 206 40)
             (remainder 40 (remainder 206 40))))

    (gcd (remainder 206 40) 
         (remainder 40 (remainder 206 40)))

    (if (= (remainder 40 (remainder 206 40)) 0)
        (remainder 206 40)
        (gcd (remainder 40 (remainder 206 40)) 
             (remainder (remainder 206 40) 
                        (remainder 40 (remainder 206 40)))
        )
    )

    (if (= 4 0) ;; remainder 프로시저 2회 실행, 총 3회 실행
        (remainder 206 40)
        (gcd (remainder 40 (remainder 206 40)) 
             (remainder (remainder 206 40) 
                        (remainder 40 (remainder 206 40)))
        )
    )

    (gcd (remainder 40 (remainder 206 40)) 
         (remainder (remainder 206 40) 
                    (remainder 40 (remainder 206 40))
         )
    )

    (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
        (remainder 40 (remainder 206 40))
        (gcd (remainder (remainder 206 40) 
                        (remainder 40 (remainder 206 40))) 
             (remainder (remainder 40 (remainder 206 40)) 
                       (remainder (remainder 206 40) 
                                  (remainder 40 (remainder 206 40))
                       )
             )
        )
    )

    (if (= 2 0) ;; remainder 프로시저 4회 실행, 총 7회 실행
        (remainder 40 (remainder 206 40))
        (gcd (remainder (remainder 206 40) 
                        (remainder 40 (remainder 206 40))) 
             (remainder (remainder 40 (remainder 206 40)) 
                       (remainder (remainder 206 40) 
                                  (remainder 40 (remainder 206 40))
                       )
             )
        )
    )

    (gcd (remainder (remainder 206 40) 
                    (remainder 40 (remainder 206 40))) 
         (remainder (remainder 40 (remainder 206 40)) 
                   (remainder (remainder 206 40) 
                              (remainder 40 (remainder 206 40))
                   )
         )
    )
    
    (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
        (gcd (remainder (remainder 40 (remainder 206 40)) 
                        (remainder (remainder 206 40) 
                                   (remainder 40 (remainder 206 40))
                        )
             )
             (remainder (remainder (remainder 206 40) 
                                   (remainder 40 (remainder 206 40))
                        )
                        (remainder (remainder 40 (remainder 206 40))
                                   (remainder (remainder 206 40)
                                              (remainder 40 (remainder 206 40))
                                   )
                        ) 
            )
        )
    )

    (if (= 0 0) ;; remainder 프로시저 7회 실행, 총 14회 실행
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
        (gcd (remainder (remainder 40 (remainder 206 40)) 
                        (remainder (remainder 206 40) 
                                   (remainder 40 (remainder 206 40))
                        )
             )
             (remainder (remainder (remainder 206 40) 
                                   (remainder 40 (remainder 206 40))
                        )
                        (remainder (remainder 40 (remainder 206 40))
                                   (remainder (remainder 206 40)
                                              (remainder 40 (remainder 206 40))
                                   )
                        ) 
            )
        )
    )

    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 

    2 ;; remainder 프로시저 4회 실행, 총 18회 실행



```

인자 먼저 계산법일 경우 계산 과정은 다음과 같다.

```
    (gcd 206 40)

    (if (= 40 0)
        206
        (gcd 40 (remainder 206 40))
    )

    (gcd 40 (remainder 206 40))
    
    (gcd 40 6) ;; remainder 프로시저 1회 실행

    (if (= 6 0)
        40
        (gcd 6 (remainder 40 6))
    )

    (gcd 6 (remainder 40 6))

    (gcd 6 4) ;; remainder 프로시저 1회 실행, 총 2회 실행

    (if (= 4 0)
        6
        (gcd 4 (remainder 6 4))
    )

    (gcd 4 (remainder 6 4))

    (gcd 4 2) ;; remainder 프로시저 1회 실행, 총 3회 실행

    (if (= 2 0)
        4
        (gcd 2 (remainder 4 2))
    )

    (gcd 2 (remainder 4 2))

    (gcd 2 0) ;; remainder 프로시저 1회 실행, 총 4회 실행
```
