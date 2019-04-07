#lang racket/gui


#|
Janela
|#
(define janela (new frame% [label "Avaliação de desempenho"] [width 640] [height 320]))


#|
Aonde o codigo do nodejs ficará

Devemos carregar códigos de exemplo 
|#

(define codigo (new editor-canvas% [label "Codigo"] [parent janela] [line-count 10] [min-width 200] [min-height 100]
                    [vert-margin 15] [ horiz-margin 15] [editor (new text%)]))



#|
Numero de clientes no total. Quando chegar nesse numero, não chegam mais clientes
|#

(define label1 (new message% [parent janela] [label "numero de clientes"]))
(define numero-clientes (new text-field% [parent janela] [label "numero de clientes"] ))


#|
Taxa de chegada de clientes por unidade de tempo
|#

(define label2 (new message% [parent janela] [label "taxa de clientes"]))
(define taxa-clientes (new text-field% [parent janela] [label "taxa de clientes"]))






#|
Com esse botão, vamos simular o código acima com um e dois executores
e aparecerá outra janela informando o resultado parcial e total

Falta o callback
|#


#|
Esse callback deve esconder a janela principal e exibir a janela de simulação
|#
(define (call-simulation-window button event)
  (send button set-label (if (equal? (send button get-label) "botao")
                             "clicked"
                             "botao")))

(define submit-to-simulation (new button% [parent janela] [label "botao"] [callback call-simulation-window]))



#|
Mandamos a janela aparecer
|#
(send janela show #t)








#|
TODO : Outra janela que será chamada quando clicarmos no botão submit-to-simulation


|#