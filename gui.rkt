#lang racket/gui

; Make a frame by instantiating the frame% class
(define janela (new frame% [label "Avaliação de desempenho"] [width 640] [height 320]))




(define codigo (new editor-canvas% [label "Codigo"] [parent janela] [line-count 10] [min-width 200] [min-height 100]
                    [vert-margin 15] [ horiz-margin 15]))
(define texto (new text%))
(send texto insert "codigo")
(send codigo set-editor texto)


(define label1 (new message% [parent janela] [label "numero de clientes"]))
(define numero-clientes (new text-field% [parent janela] [label "numero de clientes"] ))

(define label2 (new message% [parent janela] [label "taxa de clientes"]))
(define taxa-clientes (new text-field% [parent janela] [label "taxa de clientes"]))



; Show the frame by calling its show method
(send janela show #t)
