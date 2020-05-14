## DUAL

PROBLEMA PRIMALE DI PARTENZA:

max 4x1 +x2 +3x3
   x1 + 4x2       <= 1
  3x1 + -x2  +x3  <= 3
   x1,x2,x3 >= 0


PROBLEMA DUALE:
min y1 + 3y2
  y1 +3y2 >= 4
 4y1 - y2 >= 1
       y2 >= 3
y1,y2 >= 0


QUINDI, dato un problema in forma standard

max c'x
Ax <= b
x >= 0

max \sum_{j=1}^n c_jx_j
s.t.
   \sum_{j=1}^n A[i,j] x_j <= b_i  for i=1,...,m
x_j >= 0  for j=1,...,n

il suo duale è:

min b'y
A'y >= c
y >= 0

min \sum_{i=1}^m b_iy_i
s.t.
   \sum_{i=1}^m A[i,j] y_i >= c_i  for i=1,...,n
y_i >= 0  for i=1,...,m

L'IDEA E' CHE: ogni soluzione ammissibile del problema duale offre upper bound certificato e verificabile sul valore dell'ottimo del problema originario (detto problema primale).


IL WEAK DUALITY THEOREM (IL NO DUALITY THEOREM):

Dato il problema primale P ed il suo duale D,
e data una qualsiasi soluzione ammissibile x del problema P ed una qualsiasi soluzione ammissibile y del problema D. Allora vale che c'x <= b'y.

Lemma: 


LO STRONG DUALITY THEOREM (LE BUONA CAATTERIZZAZIONE:

------------x----x-----------x---O-----------------O-------------

--------------------------------[O]-----------------------------


Ecco il wording giusto dello STRONG DUALITY THEOREM:
Se P non è nè passivo nè aggressivo, ma assertivo (ha soluzione ottima)
allora anche D è assertivo (ha soluzione ottima).

Ecco il wording giusto dello STRONG DUALITY THEOREM:
Se P ha soluzione ottima x*
allora anche D ha soluzione ottima y*.
E vale che c'x*=b'y+.

-------------

_________________________________________________

DIMOSTRIAMO INSIEME IL TEOREMA DELLA DUALITA' FORTE:

PRIMALE
max 4x1 +x2 +3x3
   x1 + 4x2       <= 1
  3x1 + -x2  +x3  <= 3
   x1,x2,x3 >= 0

SCRIVIAMO IL DUALE:
min y1 + 3y2
 y1 +3y2 >= 4
4y1  -y2 >= 1
      y2 >= 3
y1, y2, y3 >= 0



DUALE:
min y1 + 3y2
 y1 +3y2 >= 4
4y1  -y2 >= 1
      y2 >= 3
y1, y2, y3 >= 0


   |  - | y1 | y2 | 
___|____|____|____| 
d  |  0 | -1 | -3 |
s1 | -4 |  1 |  3 |
s2 | -1 |  4 | -1 |
s3 | -3 |  0 |  1 |


   |  - | y1 | s3 | 
___|____|____|____| 
d  | -9 | -1 | -3 |
s1 |  6 |  1 |  3 |
s2 | -4 |  4 | -1 |
y2 |  3 |  0 |  1 |


   |  - | s2 | s3  | 
___|____|____|_____| 
d  |-10 |-1/4|-13/4|
s1 |  6 | 1/4| 13/4|
y1 |  1 | 1/4| 1/4 |
y2 |  3 |  0 |   1 |

SOLUZIONE DUALE ESTESA:

(y1,y2,s1,s2,s3, d)
( ?, ?, ?, 0, 0, ?) <-- variabili non in base a zero
( 1, 3, 5, 0, 0,10) <-- varibili in base univocamente determinat di conseguenza (e, di, fatto, le trovo nella prima colonna)
