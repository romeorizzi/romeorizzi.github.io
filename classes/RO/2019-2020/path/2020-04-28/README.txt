## Proseguiamo col nostro esercizio sul metodo del simplesso

# Aiuta sapere:

PROBLEMA DA CUI PARTITI:

max 3x +3y

   3x + 2y <= 5
   2x + 3y <= 5
   x,y >= 0


DOPO AVER INTRODOTTO LE VARIBILI DI SLACK:

max 3x +3y

   s1 = 5 -3x - 2y 
   s2 = 5 -2x - 3y
   x,y,s1,s2 >= 0

PUNTO CAMPIONE (tutto non zero):
(x,y,s1,s2,z) = (2,1,-3,-2,9)


TABLEAU INIZIALE:
                0     0 
        | - |   x ||  y
     ___|___|_____||____
  (5)z  | 0 |   3  |  3   interpretazione: z = 0 +3x +3y
  (0)s1 | 5 |  -3  | -2   interpretazione: s1 = 5 -3x - 2y 
(5/3)s2 | 5 |  -2  | -3
              (5/3)  (0) 

CON ALICE:

   |   x |  y | s1 | s2| - | 
___|_____|____|____|___|___|  
s1 |   3 |  2 |  1 |  0| 5 |    interpretazione: 3x + 2y +s1 = 5
s2 |   2 |  3 |  0 |  1| 5 |
z  |   3 |  3 |  0 |  0| 0 |  interpretazione: 0 + 3x +3y = - +z

A questo tableau iniziale è associata la soluzione:
(x,y,s1,s2,z) = (0,0,5,5,0)



TABLEAU DOVE ERAVAMO ARRIVATI:
 
   | -   |  s1 ||  y
___|_____|_____||____
z  | 5   |  -1  |  1
 x | 5/3 | -1/3 | -2/3
s2 | 5/3 |  2/3 | -5/3

A questo tableau iniziale è associata la soluzione:
(x,y,s1,s2,z) = (5/3,0,0,5/3,5)


VERIFICA CHE E' CORRETTO.
LA PROVA DEL 9 (sul punto (x,y,s1,s2,z) = (0,0,5,5,0) ).

 7432 = 7*1000 +4*100+3*10+2*1 = 7+4+3+1=17=8
 
 7342
 
 TUTTI DIVISIBILI PER 9:
 9
 99
 999
 
 PERTANTO:
 1000 = 1
 100 = 1
 10 = 1


              (5)    (0)
     | -   |  s1 ||  y
   ___|_____|_____||____
(0) z | 5   |  -1  |  1                    (0)= 5/3 -1/3(5) -2/3(0)
(0) x | 5/3 | -1/3 | -2/3  interpretazione: x = 5/3 -1/3s1 -2/3y
(5)s2 | 5/3 |  2/3 | -5/3


PUNTO CAMPIONE (tutto non zero):
(x,y,s1,s2,z) = (2,1,-3,-2,9)
L'equazione che desinisce la variabile in base x legge:
2 = 5/3 +1 -2/3
verificata!



PURE CHE E' IDENTICO A QUELLO CHE AVEVAMO SCRITTO SOPRA.


NEMO INNANZ

   | -   |  s1 ||  y   
___|_____|_____||____
 z | 5   |  -1  |  1    interpretazione: z = 5 -s1 +y 
 x | 5/3 | -1/3 | -2/3
s2 | 5/3 |  2/3 | -5/3 

(x,y,s1,s2,z)=(5/3,0,0,5/3,5)

COLONNA PIVOT (variabile entrante, BONUS = 1): y
RIGA PIVOT (primo vincolo di non-negatività a saltare): s2

FACCIAMO PIVOT: (y <---> s2):

   | -    |  s1 ||  s2   
___|______|_____||____
 z |  6   | -3/5 | -3/5     
 x |  1   | -3/5 |  2/5
 y |  1   |  2/5 | -3/5 

AMICA PROVA DEL NOVE:
PUNTO CAMPIONE (tutto non zero):
(x,y,s1,s2,z) = (2,1,-3,-2,9)

 9=z = 6  -3/5(-3)   -3/5(-2)  OK     
 2=x = 1  -3/5(-3)   2/5(-2)   OK
 1=y = 1 + 2/5(-3)   -3/5(-2)  OK 

Leggiamo la soluzione di base associata:
(x,y,s1,s2,z) = (1,1,0,0,6)

POSSO VERIFICARE CHE (1,1) E' SOLUZIONE AMMISSIBILE
ossia è un valido certifica che posso portare a casa almeno 6 euri


max 3x +3y

(3/5) *  3x + 2y <= 5
(3/5) *  2x + 3y <= 5
___________________________
(15/5)x +(15/5)y <= 3+3
x + y <= 6



E' OTTIMA OPPURE IL DIZIONARIO TI SUGGERISCE DIREZIONI DI MIGLIORAMENTO?

QUALE SAREBBE QUINDI LA COLONNA DI PIVOT?

E QUALE LA RIGA DI PIVOT CHE TI PLACCA?

SAPRESTI CONDURRE IL NUOVO PIVOT SULLA TABELLA?

