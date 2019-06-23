#lang racket/gui
(require plot)

#|
Janela
|#
(define janela (new frame% [label "Avaliação de desempenho"] [width 640] [height 320]))


#|
Aonde o codigo do nodejs ficará

Devemos carregar códigos de exemplo 
|#

#|
(define codigo (new editor-canvas% [label "Codigo"] [parent janela] [line-count 10] [min-width 200] [min-height 100]
                    [vert-margin 15] [ horiz-margin 15] [editor (new text%)]))
|#


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

(define label3 (new message% [parent janela] [label "seed"]))
(define seed (new text-field% [parent janela] [label "seed"]))

(define label4 (new message% [parent janela] [label "maximo numero de rodadas"]))
(define rodadas (new text-field% [parent janela] [label "rodadas"]))




#|
Com esse botão, vamos simular o código acima com um e dois executores
e aparecerá outra janela informando o resultado parcial e total

Falta o callback
|#


#|
Esse callback deve esconder a janela principal e exibir a janela de simulação
|#
(define (call-simulation-window button event)
  (send janela2 show #t)
  (send janela show #f))

(define submit-to-simulation (new button% [parent janela] [label "botao"] [callback call-simulation-window]))



#|
Mandamos a janela aparecer
|#
(send janela show #t)








#|
TODO : Outra janela que será chamada quando clicarmos no botão submit-to-simulation
TODO : https://stackoverflow.com/questions/27216392/how-can-i-put-a-plot-on-gui-in-racket
colocar dois snips representando os histogramas das simulações
https://docs.racket-lang.org/plot/


|#


(define janela2 (new frame% [label "simulação"] [width 640] [height 320]))
(define panel2 (new vertical-panel% [parent janela2]))
(define cont (new message% [label "número atual de clientes"] [parent panel2]))
(define numeroClientes (new message% [label "5"] [parent panel2]))
(define panel (new horizontal-panel% [parent panel2]))
(define editor (new editor-canvas% [parent panel] ))
(define editor2 (new editor-canvas% [parent panel]))
