# Primo problema di oggi:

Ho un array vet di 1.000.000 di numeri interi scritti su pietra.
Mi arrivano un 1.000.000 di query del tipo:

somma(a,b)

cui devo rispondere
$$ \sum_{i=a}^b vet[i] $$

Devo rispondere a tutte queste query entro 1 secondo complessivo (risposta a tutte le queeary entro un 1 sec).

mettere in memoria
risp[a,b]  per ogni a e b
non è possibile perchè utillizzerei 1.000.000^2 di memoria.

IDEA:
trovare una sottofamiglia dello spazio di tutte le possibili domande con le seguenti due proprietà:
1. la famiglia è sparsa (al più O(n) domande)
2. ogni possibile domanda è facile una volta note le risposte alla sottofamifglia sparsa
3. la computazione di tutte le risposte alle domande nella famiglia sparsa deve essere fatta rapida (in O(n)).

SUGGERIMENTO DEL COMPAGNO:
la fambila degli intervalli prefissi

risp[0,b]  per ogni b

1. sono al più n domande
2. la domanda generica la rispondo in O(1) utilizzando due sole risposte a problemi della sotto-famiglia.
3. le domande nella famiglia sparsa cadono come i birilli:

ss[N] = 0;
for(int i = N-1; i>=0; i--)
   ss[i] = vet[i] + ss[i+1] ;

prefix-sum

suffix-sum

int vet[N];
int ss[N+1];
$$
ss[i] = \sum_{j=i}^{i-1} vet[j] 
$$

int somma(a,b) {
    assert(a >= 0 && a <= b && b < N); 
    return ss[a] - ss[b+1];
}



```
def somma(int a, int b):
   assert 0 <= a <= b <= N 
   if b == N+1:
      if a == b:
         return 0;
      return somma(a+1,b)
   if memo[a,b] != None:
      return memo[a,b]
   return somma(a, N+1) - somma(b+1,N+1)


somma(4,8) = somma(0,8) - somma(0,3)
somma(0,8) = somma(0,8) - somma(0,4)
         [       ] =
[                ] -
[       ]

somma(a,b) = ps(b) - ps(a-1)

a = 0

ps(b) = ps(b,0) = ps(b) -ps(0)

3 4 -5 2 6 7 4 9 3 6 

  ^            ^
  ^              ^
       ^     ^
^          ^
a          b


3  4 -5  2  6  7  4  9  3  6 
3  7  2  4 10 17 21 30 33 39
___
_____
________
__________
____________

```

# Secondo problema di oggi:

Ho una matrice mat di 1.000 x 1.000 numeri interi scritti su pietra.
Mi arrivano un 1.000.000 di query del tipo:

somma_rettangolo(r1,r2,c1,c2)

cui devo rispondere
$$ \sum_{i=r1}^{r2} \sum_{j=c1}^{c2} mat[i][j] $$

Devo rispondere a tutte queste query entro 1 secondo complessivo (risposta a tutte le queeary entro un 1 sec).

ESEMPIO DI MATRICE DI QUERY GENERICA:

#############       ########        ########          ####        ####
#############       ########        ########          ####        ####
####§§§§#####       ####§§§§                          ####
####§§§§#####   =   ####§§§§   -                -     ####    +   
####§§§§#####       ####§§§§                          ####
#############
#############
#############

QUANTE SONO LE POSSIBILI QUERY?

Un sottorettangolo è catturato da:
1.  una coppia di righe  O(m^2)
2.  una coppia di colonne  O(n^2)
    
totale = O(m^2 n^2)

DIMENSIONE INPUT: O(mn)

AMERIKA SAREBBE = O(mn)


PROGETTO FAMIGLIA DI DIMENSIONE O(mn)
(e sottofamiglia di quella di tutte le possibili domande)

Nel caso monodimansionale somma(0,b)
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXX^

Nel caso bidimensionale somma_intervallo(0,0,a,b)

somma_intervallo(r1,c1,r2,c2) =  somma_intervallo(0,0,r2,c2) - somma_intervallo(0,0,r1-1,c2) -somma_intervallo(0,0,r2,c1-1) + somma_intervallo(0,0,r1-1,c1-1)

PRINCIPIO INCLUSIONE ESCLUSIONE:
$$ |A \cup B| = |A| + |B| - |A\cap B| $$

PRINCIPO INCLUSIONE ESCLUSIONE
$$ |\cup_{i=1}^m A_i| = ? $$ 

VERIFICHIAMO LA (3), OSSIA CHE I SOTTOPROBLEMI DELLA FAMIGLIA CADONO COME I BIRILLI (in O(1) cadauno):

somma_intervallo(0,0,a,b) = somma_intervallo(0,0,a-1,b) + somma_intervallo(0,0,a,b-1) - somma_intervallo(0,0,a-1,b-1) + mat[a][b]

ABCD
EFGH   = 
ILMN

ABCD
EFGH   +  

ABC
EFG   - 
ILM

ABC
AFG

+ N

dove N = mat[a][b]


*****
***?*
*****
*****

****|*
***?|*
____|
**** *
**** *

E NEL DINAMICO?

supponi che ho due tipi di richieste alla mia struttura dati:

1.  somma(a,b)
2.  update(i,new_val)

COSA NON SI PUO' SALVARE DELLE SOMME PREFISSE:
1. non posso pensare di tenermi aggiornata ps[i] i = 0...N
```
                         update  
                         X
---------------------------------------------------------
--------------------------]
---------------------------]
----------------------------]
...
---------------------------------------------------------]
```

AMERIKA: siamo aperti al compromesso:

1.  somma(a,b) in O(log n)
2.  update(i,new_val) in O(log n)

QUINDI VOGLIAMO PROGETTARE UNA FAMIGLIA DI INTERVALLI CON LE SEGUENTI DUE PROPRIETA':
1. la massa dentro il generico intervallo [a,b] sia ottenibile come somme/differenza di masse in intervalli entro la famiglia sparsa.
2. quando faccio un'update, quel singolo elemento che modifico, aappartiene ad al più O(log n) intervalli della famiglia sparsa.

                                            
COSA SI PUO' SALVARE DELLE SOMME PREFISSE?

1. conviene lavorare prima su problemi monodimensionali.
2. se uno mi risponde somma(0,a) per il generico a, allora so ben io come rispondere somma(a,b)

GRAZIE ALLA 2 AGGIORNO (SEMPLICANDOLE) LE MIE AMBIZIONI:

QUINDI VOGLIAMO PROGETTARE UNA FAMIGLIA DI INTERVALLI CON LE SEGUENTI DUE PROPRIETA':
1'. la massa dentro il generico intervallo [0,x] sia ottenibile come somme/differenza di masse in intervalli entro la famiglia sparsa.

COSA POTREBBE ESSERE L'AMERIKA?

1''. la massa dentro il generico intervallo [0,x] sia ottenibile come somma di masse in intervalli entro la famiglia sparsa.
2''.  corrispondenza biunivoca semplice tra le domande della sotto-famiglia e le posizioni del vettore (quindi magari di nuovo sono tutti allocabili in un vettorazzo).

Partendo con 1 e 2 la nostra Amerika sarà i FENWEEK TREES:

````
- - - - -]
- - - -]
- - -]
- -]
-]
        1
      1 0   
  1 1 0 0
1 0 1 0 1 
1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6  <-- indici 
3 4 2 5 1 3 2 1 1 3 2 2 1 2 1 2  <-- vec input
X
X X
    X 
X X X X
        X
        X X
            X
X X X X X X X X

```
  ^ 

 per ogni i c'è esattamente un intervallo di Feenwek che ha estremo destro in i, lo chiamo ft[i] 
   

Allora somma(0,i) = ft[i] + somma(0,j)  dove j+1 è l'estremo sinistro di quell'unico intervallo di feenweek con estremo destro in i. 


