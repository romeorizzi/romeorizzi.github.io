## Proseguiamo col nostro esercizio sul metodo del simplesso

# Aiuta sapere:

Funzione lineare e regione ammissibile X convessa implicano che ogni ottimo locale è anche un ottimo globale.

x ottimo globale (facciamo massimo) su X significa che f(x) >= f(x') per ogni x'  nella regione ammissibile.

x ottimo locale (facciamo sempre che stiamo massimizzando) significa che
esiste un intorno chiuso S(x,\epsilon) in cui x è interno
tale che x è ottimo globale su S(x,\epsilon)

##  

max 3x +2y

   3x + 2y <= 5
   2x + 3y <= 5
   x,y >= 0

PRIMA COSA DA FARE: salire in uno spazio a n+m dimensioni introducendo le variabili di slack.

_______________

max 3x +3y

   3x + 2y + s1 = 5
   2x + 3y +s2 = 5
   x,y >= 0

Sottospazio (S) definizione variabili di slack:
s1 = 5 - 3x -2y
s2 = 5 - 2x - 3y

D'ora in poi ci manterremo in questo sottospazio affine.
Il nostro spazio della soluzioni ammissibili è ora quello delle quadruple
(x,y,s1,s2) >= 0
prigioniere di tale sottospazio affine.

*:
s1 = 5 - 3x -2y
s2 = 5 - 2x - 3y

inizialmente (0,0,5,5) x ed y erano pulite e quindi andava bene che x ed y erano le  variabil indipendenti nella scrittura (*).

(0,0,5,5) è la soluzione di base associata al disonario (*). E' quella che si ottiene fissando a 0 le variabili indipendenti e leggendo di conseguenza le variabili dipendenti (dette variabili in base).
Una tale soluzione (una che ammetta un dizionario) è detta di base.
Una soluzione di base è detta ammissibile se rispetta i vincoli di non negatività.
In questo modo un dizionario ammissibile esprime un vertice del politopo. 

Ora, quando passiamo a (5/3,0,0,5/3), la x si è sporcata, ma sono pulite la y e la s1.
Il nostro lavoro (pivot) è pertanto riscrivere il sottospazio (S) in termini della s1 e della y come variabili indipendenti (pulite).

________________________

PRIMO PIVOT:

vogliamo esprimere lo stesso identico sottospazio con una riscrittura equivalente delle condizioni (*) nella quale però le varuiabili indipendenti siano entrambe poste a zero. (Ossia, invece che la coppia (x,y) la coppia (,y) ).

Come effettuare la riscrittura di:

max 3x +3y
s1 = 5 - 3x -2y
s2 = 5 - 2x - 3y

non mi piace ragionare in termini di x, e nemmeno di s2 perchè son > 0 (e quindi non sò proprio in che direzioni muovermi con loro). 

Mi stà bene di guardare al mondo in termini di y e s1.
Come si procede per ottenere la riscrittura?

1. si riscrive l'equazione di pivot. Perchè? Perchè è l'unica ad ospiare una soloa variabile sbifida (>0).
(Nota. l'equazione di pivot è quella contro cui ero andato a sbattere quando cercavo di pingere al massimo sulla x).


s1 = 5 - 3x -2y  -->  3x = 5 -s1 -2y  ---(siccome 3 \neq 0)---> x = 5/3 -1/3s1 -2/3y

Ecco quindi la riga di pivot invertita:

x = 5/3 -1/3s1 -2/3y

ED ORA COME RISCRIVERE LE ALTRE RIGHE?

Quello ceh non ci piace della scrittura attual nelle altre righe è che compare a destra la x che è sbifida (oltre ad essere sbifida la variabile basica a sinistra che esse definiscono).

Vorrei sbarazzarmi della x.
Come fare?

Uso la riga pivot invertita (che ora definisce la x in termini di variabili pulite) ed il meccanismo della sostituzione.

dentro:
s2 = 5 -2x -3y
sostituisco:

x = 5/3 -1/3s1 -2/3y

ossia, operativamente:
il termine 2x --> 2(x) -> 2(5/3 -1/3s1 -2/3y) 
poi distribuisco, poi raccolgo in scatole scarpe (forcehtte con forchette, cucchiai con cucchiai, ... ) raccogliendo i due coefficienti (e sommandoli di fatto) associati a ciascheduna singola variabile.

s2 = 5/3 +2/3s1  -5/3y

Riscriviamo la funzione obiettivo:

max 3x +3y
-->
max 5 -s1 +y

In definitica siamo sparcati su:

max 5 -s1 +y
x = 5/3 -1/3s1 -2/3y
s2 = 5/3 +2/3s1  -5/3y

PRESENTI INTRINSECAMENTE (quindi d'ora in poi li lasceremo impliciti)
x,s >= 0

Per persguire la compattezza, evitiamo anche, d'ora in poi, di riscivere i nomi delle variabili (li mettiamo solo come etichette di colonna e di riga)
   | -  |   s1 |   y
___|____|______|_____
z  | 5  |   -1 |   1
x  | 5/3| -1/3 | -2/3
s2 | 5/3|  2/3 | -5/3

Dove abbiamo dato un nome (quì z) al valore della funione obiettivo.

Signore e signori, ecco il vostro primo tableau.

Provate voi a comporre il tableau del dizionario iniziale:

max 3x +3y
s1 = 5 - 3x -2y
s2 = 5 - 2x - 3y
s1,s2 >= 0

TABLEAU INIZIALE:

   | - |   x |  y
___|___|_____|____
z  | 0 |   3 |  3
s1 | 5 |  -3 | -2
s2 | 5 | -22 | -3

COME SI FA' IL PIVOT SUL TABLEAU:

1. L'elemento della riga di pivot viene invertito (rispetto al prodotto)
2. Tutti gli altri elementi della riga di pivot vengono divisi per il pivot ed invertiti di segno
3. Tutti gli altri elementi della colonna di pivot vengono divisi per il pivot
4. Ogni altro elemento viene aggiornato sottraendogli un termine correttivo.

            | |
            |a|.......x
            | |       .
____________|_|_______._____ 
            |p|       b
____________|_|_____________   <-- RIGA DI PIVOT
            | |
 	    | |

             ^ colonna di pivot

per calcolare tale termine correttivo per la generica entry x che non sia nè sulla riga nè sulla colonna di pivot si individuano prima i termini a e b che gli corrispondono nella colonna e nella riga di pivot.

Dopodichè:

TERMINE CORRETTIVO = ab/p
che dimensionalmente è un (banane)^2/banane = banane, forse ci siamo

VERIFICHIAMO SPERIMENTALMENTE CHE L'ABBIAMO AZZECCATA:

Applichiamo queste regolette al

TABLEAU INIZIALE:
           0     0 
   | - |   x  |  y
___|___|______|____
z  | 0 |   3  |  3
s1 | 5 |  -3  | -2
s2 | 5 |  -2  | -3


dove come colonna di pivot avevamo scelto quella della x, cosa succede dopo?

chi mi ferma (nell'incrementare la x)
che è la riga di pivot?

le due domande hanno la stessa risposta.
La riga di pivot è: s1
Quindi facciamo pivot portando x in base ed s1 fuori base:
 
   | -   |  s1  |  y
___|_____|______|____
z  | 5   |  -1  |  1
 x | 5/3 | -1/3 | -2/3
s2 | 5/3 |  2/3 | -5/3

VERIFICA PURE CHE E' IDENTICO A QUELLO CHE AVEVAMO SCRITTO SOPRA.

SAI LEGGERE LAS SOLUZIONE DI BASE ASSOCIATA A QUESTO DIZIONARIO?

E' OTTIMA OPPURE IL DIZIONARIO TI SUGGERISCE DIREZIONI DI MIGLIORAMENTO?

QUALE SAREBBE QUINDI LA COLONNA DI PIVOT?

E QUALE LA RIGA DI PIVOT CHE TI PLACCA?

SAPRESTI CONDURRE IL NUOVO PIVOT SULLA TABELLA?

