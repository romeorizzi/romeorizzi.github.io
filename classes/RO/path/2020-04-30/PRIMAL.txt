## DUALITY

PROBLEMA DA CUI PARTITI:

max 4x1 +x2 +3x3
   x1 + 4x2       <= 1
  3x1 + -x2  +x3  <= 3
   x1,x2,x3 >= 0

Riconosco un problema di PL in forma standard ad origini ammissibile.
Potrei associargli subito il suo tableau iniziale (quello costituito dalle equazioni che definiscono le variabili di slack):

   |  - | x1 | x2 | x3 | 
___|____|____|____|____| 
z  |  0 |  4 |  1 |  3 |
s1 |  1 | -1 | -4 |  0 |
s2 |  3 | -3 |  1 | -1 |

E poi sappiamo come andare avanti
 ... ma che noia !!!

Giochiamo allora a spararle.
Facciamo a chi offre di più.

Io offro 0 !

Eh sì, io sò portare a casa 0 euri. Evviva!!!

Se non siete convinti, ecco il certificato.

(x1,x2,x3) = (0,0,0)
controllate pure voi Re Artù che è ammissibile e che porta a casa 0 euri in termini di funzione obiettivo.

Chi offre di più?

Chi offre un miglior lower bound sul valore dell'ottimo?

Davide offre (1,0,0) --> 4 e di nuovo Re Artù può verificare (può proprio mettersi quei 4 euro in  tasca, favorisca prego le coordinate IBAN).

Gastone offre (0,0,3) --> 9 euri e di nuovo Re Artù può verificare.

Cominciamo a lavorare sull'altro versante:
chi saprebbe aiutarmi a mettermi l'animo in pace e starmene soddisfatto con questi 9 euro o poco più?

Chi saprebbe fornirmi un upper bound.

Chi mi convince che oggi non è il giorno giusto per guadagnare un 1.000.000 di euro da questa attività?


max 4x1 +x2 +3x3
   x1 + 4x2       <= 1
  3x1 + -x2  +x3  <= 3
   x1,x2,x3 >= 0

x1 <= 1 (dal primo vincolo)
x2 <= 1/4 (dal primo vincolo)
x3 <= 3+1/4 = (12+1)/4 = 13/4

Quindi 4x1 +x2 +3x3 <= 4(1) + 1(1/4) + 3(13/4) = 14

Somma il primo vincolo al secondo moltiplicato per 3:

1:    x1 + 4x2        <= 1 = b1
3:   3x1 + -x2   +x3  <= 3 = b2
_________________________
    10 x1 +1 x2 +3 x3  <= 10
    v|    v|     v
z = 4 x1  +1 x2 +3 x3

Quindi non posso proprio guadagnare più di 10 euro.

Il certificato del NO sono due moltiplicatori y1=1 e y2=3 (uno per vincolo)
soggetto ai seguenti vincoli:

dominanza sul coefficiente della x1: 
(1,3)(y1,y2) >= 4
dominanza sul coefficiente della x2: 
(4,-1)(y1,y2) >= 1
dominanza sul coefficiente della x4: 
(0,1)(y1,y2) >= 3

ossia:
  y1 +3y2 >= 4
 4y1 - y2 >= 1
       y2 >= 3
y1,y2 >= 0


vorrò minimizzare l'upper bouds = (b1,b2)*(y1,y2) 

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

La sai la figata?
Il duale del duale è il primale.

Ecco la proof che trovi anche sul Vanderbei:

Proviamo a fare il duale di:

min b'y
A'y >= c
y >= 0

Noi sappiamo come fare il duale di un problema in forma di massimizzazione standard, ma c'è un piccolo problema ...  questo non è un problema di massimizzazione standard.

Ma noi sappappiamo come riportare ogni problema di PL in quella forma.

Facciamolo:

- (max -b'y
-A'y <= -c
y >= 0)

ok, ora è in forma standard e posso usare la regola per costruirne il duale:

- (min -c'z
-Az >= -b
z >= 0)

semplifico:

max c'z
Az <= b
z >= 0

che è istess che il problema primale eccetto per il fatto che le variabili ore le ho labellate z piuttosto che x, ma appunto l'è istess.

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

Lemma: 


LO STRONG DUALITY THEOREM (LE BUONA CAATTERIZZAZIONE:

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










RICHIAMO SUL PRODOTTO DI MATRICI:

 A  *  B
m n   p q

   n=p


C = A  *  B

C[i,j] = A_i * B^j

x1 ------>---3----5-----
             |    |
x2 ------>---4----5----
             |    |
             |y1  |y2
             V    V
          --10---100----------> z 


y1 = 3x1 +4x2
y2 = 5x1 +7x2

z = 10y1 +100y2



