#lang racket
(define seed 0)
(define (set-seed x)
  (set! seed x)
  )


(define factorial 
  (lambda (n)
    (if (= n 0) 
        1
        (* n (factorial (- n 1))))))


(define (uniform a b x_0 c)
  (define x_i (modulo (+ (* a x_0) c) b))
  ;a é o a mesmo
  ;c idem
  ;b é o M
  ;da formula xi=(ax + c) mod M
  (set! seed (/ x_i b))
  seed
  ;(/ x_i b)
  ;setando direto na seed, e retornando
  
  )

(define (exponencial lbd u [l 0] [h 1])
  (define lg (log u))
  (define _1_lbd (/ 1 lbd))
  (define prod (* _1_lbd lg))
  (define x (- 0 prod))
  (set! seed x)
  x
  )


(define (poisson lbd k [l 0] [h 1])
  (define lbd_x (expt lbd k));  lbd^x
  (define x_fact (factorial k)); k!
  (define _lbd (- 0 lbd));-lbd
  (define exp__lbd (expt (exp 1) _lbd));e^(-lbd)
  (define resp (* exp__lbd (/ lbd_x x_fact)))
  (set! seed x)
  resp
  )

(uniform 3 11 4 2)
(exponencial 3 0.4)
(poisson 3 5 0 1)