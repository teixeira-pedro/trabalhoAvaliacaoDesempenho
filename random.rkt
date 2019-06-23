#lang racket

(require memoize)

(define seed 0)
(define (set-seed x)
  (set! seed x))


(define/memo (factorial n)
    (if (= n 0) 
        1
        (* n (factorial (- n 1)))))


(define (uniform [a 3] [b 5] [x_0 seed] [c 65535])
  (define x_i
    (modulo
     (+
      (* a x_0) c) b))
  ;a é o a mesmo
  ;c idem
  ;b é o M
  ;da formula xi=(ax + c) mod M
  (set! seed
        (/ x_i b))
  seed)
  ;(/ x_i b)
  ;setando direto na seed, e retornando

(define (exponencial u [lbd 3] [l 0] [h 1])
  (define lg (log u))
  (define _1_lbd (/ 1 lbd))
  (define prod (* _1_lbd lg))
  (define x (- 0 prod))
  (set! seed x)
  seed)


(define (poisson k [lbd 7] [l 0] [h 1])
  (define lbd_x (expt lbd k));  lbd^x
  (define x_fact (factorial k)); k!
  (define _lbd (- 0 lbd));-lbd
  (define exp__lbd (expt (exp 1) _lbd));e^(-lbd)
  (define resp (* exp__lbd (/ lbd_x x_fact)))
  (set! seed resp)
  seed)

(module+ test
  (require rackunit)
  (check-equal? (uniform 3 11 4 2) (/ 3 11))
  (check-equal? (exponencial 0.4 3) 0.30543024395805163)
  (check-equal? (poisson 5 3 0 1) 0.1008188134449245))