IL WEAK DUALITY THEOREM (IL NO DUALITY THEOREM):

Dato il problema primale P:
max c'x
Ax <= b
x >= 0

Ed il suo duale D:
min b'y
A'y >= c
y >= 0

E data una qualsiasi soluzione ammissibile x del problema P ed una qualsiasi soluzione ammissibile y del problema D. Allora vale che c'x <= b'y.

_________________ 


LO STRONG DUALITY THEOREM (LE BUONA CARATTERIZZAZIONE:

------------x----x-----------x---O-----------------O-------------

--------------------------------[O]-----------------------------

max x1 + x2      <---  unbounded
  x1 <= 3
  x1,x2 >= 0

min 3y1       <--- sparisce nel rapporto di coppia (e infeasible) 
y1 >= 1
0*y1 >= 1
y1

Potete sempre costruire esempi di coppie dove entrambi, non dialogando, si precludono l'esistenza (entrambi infeasible)

Ecco il wording giusto dello STRONG DUALITY THEOREM:
Se P non è nè passivo nè aggressivo, ma assertivo (ha soluzione ottima)
allora anche D è assertivo (ha soluzione ottima).

Ecco il wording giusto dello STRONG DUALITY THEOREM:
Se P ha soluzione ottima x*
allora anche D ha soluzione ottima y*.
E vale che c'x*=b'y+.

PROOF:

## PRIMAL

PROBLEMA PRIMALE DI PARTENZA:

max 4x1 +x2 +3x3
   x1 + 4x2       <= 1
  3x1 + -x2  +x3  <= 3
   x1,x2,x3 >= 0


   |  - | x1 | x2 | x3 | 
___|____|____|____|____| 
z  |  0 |  4 |  1 |  3 |
s1 |  1 | -1 | -4 |  0 |
s2 |  3 | -3 |  1 | -1 |

   |  - | x1 | x2 | w2 | 
___|____|____|____|____| 
z  |  9 | -5 |  4 | -3 | 
w1 |  1 | -1 | -4 |  0 |
x3 |  3 | -3 |  1 | -1 |


   |  - | x1  | w1 | w2 | 
___|____|_____|____|____| 
z  |  10| -6  | -1 | -3 |
x2 | 1/4|-1/4 |-1/4|  0 |
x3 |13/4|-13/4|-1/4| -1 |

COMPETENZA SAPER LEGGERE LE TABELLE:

LEGGO LA SOLUZIONE DI BASE PRIMALE ASSOCIATA:

SOLUZIONE PRIMALE ESTESA:

(x1, x2,  x3,w1,w2, z)
( 0,  ?,   ?, 0, 0, ?) <-- variabili non in base a zero
( 0,1/4,13/4, 0, 0,10) <-- varibili in base univocamente determinat di conseguenza (e, di, fatto, le trovo nella prima colonna)

PROBLEMA PRIMALE DI PARTENZA:

max 4x1 +x2 +3x3
   x1 + 4x2       <= 1 (*)
  3x1 + -x2  +x3  <= 3 (*)
   x1,x2,x3 >= 0

*1    x1 + 4x2       <= 1 (*)
*3   3x1 + -x2  +x3  <= 3 (*)
_____________________________
    10  x1 + 1  x2 +3  x3  <= 10
	 V       ||     ||  
     4  x1 + 1  x2 +3  x3

-6(x1 >= 0)

-------------

Lemma 0.1.
Siano
(x_1 , ... , x_n )
una soluzione primale qualiasi (intendi: anche non ammissibile),
(y 1 , ... , y_m )
una soluzione duale qualiasi e si considerino le variabili di slack.
Ossia, NOI GUARDIAMO ALLE SOLUZIONI ESTESE.

(x_1, ... ,x_n, w_1 , ... , w_m, z)
e          |    |           |    |
(s_1, ... ,s_n, y_1 , ... , y_m, z)


Allora vale
\sum_{j=1}^n c_j x_j = \sum_{i=1}^m b_i y_i - \sum_{j=1}^n s_j x_j - \sum_{i=1}^m w_i y_i

Corollario 1:
Teorema della dualita debole: \sum_{j=1}^n c_j x_j <= \sum_{i=1}^m b_i y_i per ogni coppia di soluzioni ammissibili x di (P) e y di (D).
proof: \sum_{j=1}^n s_j x_j >= 0   per non-negatività delle x e per ammissibililità duale delle y
      e \sum_{i=1}^m w_i y_i >= 0  per non-negatività delle y e per ammissibililità primale delle x

Teorema degli scarti complementari:
1. due soluzioni ammissibili x di (P) e y di (D) sono ottime se \sum_{j=1}^n s_j x_j = 0  e  \sum_{i=1}^m w_i y_i = 0
proof: quando il termine correttivo è nullo allora \sum_{j=1}^n c_j x_j = \sum_{i=1}^m b_i y_i da cui segue l'ottimalità di entrambi dal teorema della dualità debole.
2. se x soluzione ottima di (P) ed y soluzione ottima di (D) allora \sum_{j=1}^n s_j x_j = 0  e  \sum_{i=1}^m w_i y_i = 0
proof: il termine correttivo deve essere nullo per il teorema della dualità forte.

Riscrittura del teorema degli scarti complemtari come spesso viene usato:
Sia x una soluzione ottima non-degenere del problema (P), allora esiste una unica soluzione ottima y del problema (D)
e può essere univocamente calcolata come segue:
utilizzando le condizioni degli scarti complementari, ossia:

     \sum_{j=1}^n s_j x_j = 0 
and   \sum_{i=1}^m w_i y_i = 0
ossai data la non-negatività di tutti questi termini, \sum_{j=1}^n s_j x_j +  \sum_{i=1}^m w_i y_i = 0
ossia le segenti m+n consizioni.

    s_j * x_j = 0 per ogni j    (condizioni degli scarti complementari di tipo 1)
    w_i * y_i = 0 per ogni i    (condizioni degli scarti complementari di tipo 2)
	
Noti gli x e i w, queste sono m+n equazioni lineari sulle m+n variabili (w,y).

Come salvare la vita al vostro docente che deve correggere un esercizio dove vi aveva chiesto le soluzioni primale e duale ottima di un certo problema di PL, ma voi gli avete dato solo la soluzione primale ottima.

(x_1, ... ,x_n, w_1 , ... , w_m, z)
e          |    |           |    |
(s_1, ... ,s_n, y_1 , ... , y_m, z)

metti che lo studente mi ha dato solo gli x

Riesco però a ricostruire i w:

w = b - Ax

restano da ricostruire le (s,y):

costruisco il seguente sistema:

1. tutte le volte che x_j > 0 allora s_j = 0 (a causa delle condizioni degli scarti complementari di tipo 1)

2. tutte le volte che w_j > 0 allora y_j = 0 (a causa delle condizioni degli scarti complementari di tipo 2)

Cioè:

il problema duale racconta:

   \sum_{i=1}^m A[i,j] y_i >= c_j  per j = 1,..., n
   
ho m incognite y.
Però, un certo numero di queste se ne sparisce a 0 per le condizioni degli scarti complementari di tipo 1.
Inoltre, delle diseguaglianze raccontate a zero quì sopra, alcune devono valere ad uguaglianza per le condizioni degli scarti complementari di tipo 2.
Ci sevono m in totale di queste condizioni di tipo 1 + 2 per determinare le m variabili y.
Ma noi abbiamo assunto che (x,w) sia soluzione non-degenere, ossia abbia precisamente n componenti a zero, pertanto, in effetti,
delle m+n condizioni degli scarti complementari precisamente (m+n) - n = m lavorano per noi.

_____________________________________________





