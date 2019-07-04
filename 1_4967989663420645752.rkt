#lang racket

(struct fila (ff atend eventos) #:mutable )
;(append '(1 2) '(3 4))
;(define kakaka (remove 2 kakaka))
; (fila-ff F) === F->ff
(define F
  (fila '() '() '())
  )

(define (vazia_atend F)
  (equal? '() (fila-atend F))
)

(define (vazia_eventos F)
  (equal? '() (fila-eventos F))
)

(define (vazia_ff F)
  (equal? '() (fila-ff F))
)

(define (enfila f item)
  (cons f item)
)

(define (desenfila f)
  (let ((item (car f)))
        (set! f (cdr f))
         item)
)

(define (obtem f)
  (car f)
  );não retira da fila

(define (get-event F)
  (desenfila (fila-eventos F))
)

(define (queue F e exp_aleat)
  (enfila (fila-atend F) e)
  (if (and (vazia_atend F) (vazia_ff F))
      (enfila (fila-eventos F) exp_aleat)
      "else"
   )
)

(define (unqueue F exp_aleat)
  (desenfila (fila-atend F))
  (if (not ((vazia_ff F)))
      (begin (let k (desenfila (fila-ff))) (queue F k exp_aleat))
      "elsse"
   )
)

