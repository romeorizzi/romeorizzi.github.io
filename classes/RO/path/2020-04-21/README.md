# Introduzione alla programmazione lineare e metodo del simplesso

## motivazioni fornite allo studio della PL

Il tandem/sinergia e stretta interrelazione tra i seguenti due problemi/modelli:

1. PL: la programmazione lineare (in P)

2. PLI: la programmazione lineare intera (NP-hard)

costituiscono il principale cavallo di battaglia della Ricerca Operativa.
La PL, con la sua struttura ed i suoi teoremi, fornisce inoltre cornice concettuale e metodologica in più discipline della matematica e campi applicativi della stessa.
Le buone caratterizzazioni che portiamo a casa sono la teoria della dualità ed il teorema degli scarti complementari.
Uno strumento fondamentale è l'algoritmo del simplesso. Vediamo di portarcelo a casa.

## testi di riferimento

1. Vi ho consigliato di lavorare sui primi 5 capitoli del Vanderbei:

   1. [il testo di Robert J. Vanderbei](http://freecomputerbooks.com/Linear-Programming-Foundations-and-Extensions.html)

2. Valido anche e complementare ad esso:

   1. [il testo di Frederick S. Hillier](https://www.academia.edu/33097442/Hillier_Lieberman_Introduction_to_operation_research_1_.pdf)


## materiali di riferimento

First of all: Se trovi materiali validi segnalaceli che li aggiungeremo volentieri alla lista.

Suggerisco di percorrere i seguenti percorsi:

1. [partire richiamando cosa sia il problema della PL](https://www.zweigmedia.com/RealWorld/tutorialsf4/frames4_3.html)

2. [rafforzare l'interpretazione geometrica del problema](https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-410-principles-of-autonomy-and-decision-making-fall-2010/lecture-notes/MIT16_410F10_lec17.pdf)

________________________________________

Sappiamo come i funzionali lineari offrano in generala la prima approssimazione, spesso l'unica poi gestibile.
La programmazione lineare si pone il problema di massimizzare
una funzione lineare

\sum_{i=1}^n c_i x_i = (c_1, ..., c_n) * (x_1, ..., x_n)

ossia di guadagnare un punto che sia il più possibile in là nella direzione di dove ci porta il gradiente (e noi pensiamo esso sia un vento uniforme su tutto R^n).


Non basta:
anche per quanto riguarda i vincoli ci limitiamo a considerare vincoli linerari.
Questi possono essere di <=, di >=, oppure di =.
Quelli di < non li vuoi davvero, riformula meglio il tuo problema e scoprirai che non ti servono (può essere un percorso lungo e faticoso a volte, ma vedila come che ti offrirà pur sempre un'occasione di maggiore comprensione).

Quindi:

1 dimensione

x <= 3

#################
________________*___________________>
               x=3
                ##################################

La tecnica generale per capire un vincolo di diseguaglianza è che prima si capisce quello ad eguaglianza e poi sì fa picking su un singolo punto non sulla ciccatrice dell' =. Questa ciccatrice partizione R^n sotto condizioni abbastanza generali, che certo valgono nel caso di funzionali lineari.


2 dimensioni

x+y = 1   (1,1)(x,y) = 1

|
|
|\
| \
|  \
____\______
     \

3 dimensioni

ax +by +cz = d

(a,b,c)(x,y,z) <= d

CONVESSITA' di un sottoinsime S di R^n:

Def: per ogni due punti, tutto il segmento tra essi è incluso

algebrica: per ogni due punti x_1,x_2 in S:
per ogni lamda_1 + lamda_2
s.t.
lamda_1 + lamda_2 = 1
lamda_1, lamda_2 >= 0

si abbia:
p = lamda_1 x_1 + lamda_2 x_2 in S

Lemma: se S1 ed S2 son convessi allora S1 \cap S2 è convesso


max 3x_1 +2x_2 +5x_3
s.t.
   x belongs to una intersezione di semi-spazi


Conclusione: gli ottimi di un problema di PL sono una faccia del politopo regione ammissibile.

_______________________________________________________

FORMA DI MASSIMIZZAZIONE STANDARD:

max f(x)
   g_i(x) <= b_i  i=1,...,m
   x_i >= 0

COSA FARE SE FOSSE UN PROBLEMA DI MINIMIZZAZIONE?
min x +3y
lo renderizzo come:
-max -x -3y

COSA SE AVESSI UN VINCOLO DI >=

2x -y +5z >= 53

lo renderizzo come:
-2x +y -5z <= -53

(ossia ho moltiplicato per -1)

COSA SE AVESSI UN VINCOLO DI =

2x -y +5x = 53

lo renderizzo come l'AND di due vincoli:

2x -y +5z <= 53
2x -y +5z >= 53

(ed il secondo orma sapete come trattarlo)

COSA SE AVESSI UNA VARIABILE LIBERA

Def: una variabile libera è una variabile che può essere sia arbitrariamente grande che arbitrariamente piccola.

COme rappresentare una variabile free:
<------   ------>   x LIBERA

In termini di variabili non-negative:

--->

Potrei prenderne due e metterle spalla a spalla:

<---| |--->

Per rappresentare x libera, introduco una x^+ ed una x^- entrambe non-negative
con x^+ che rappresante la parte non-negativa
e   x^- che rappresante la parte non-positiva

e sostituire ogni occorrenza di x come segue:

x --> x^+ -x^-

Esempio:

max 3x +2y

    x + y <= 5
    x -2y <= 4
x >= 0, y free

Lo rappresento come:
max 3x_1 +2(x^+_2 -x^-_2) = 3x_1 +2x_2^+ -2x_2^-

    x + y^+ -y^-  <= 5
    x -2y^+ -2y^- <= 4
y_1, y^+_2, y^-_2 >= 0

__________


Lemma (easy): data una qualsiasi soluzione ammissibile (x,y) per il problema originario, esiste una soluzione ammissibile del problema cucinato per l'oracolo che totalizza almeno quel valore di funzione obiettivo.

Lemma (hard): data una qualsiasi soluzione ammissibile (x,y_+,y_-) per il problema cucinato, esiste una soluzione ammissibile del problema originario che totalizza almeno quel valore di funzione obiettivo.

proof easy: Consider the solution:
x := x
y_+ := if y >= 0 then y else 0;  # check that y_+ is non-negative
y_- := if y < 0 then -y else 0;  # check that y_- is non-negative

Check it out (namely: feasibility check + same objective function value). QED

proof hard: Consier (x,y) := (x,y_+ - y_-). Check it out. QED

__________________________________________________


max 3x -2y

   3x + 2y <= 5
   2x + 3y <= 5
   x,y >= 0

problema ad origine ammissibile (b>=0).
In questi l'origine è soluzione ammissibile di base.
(A meno che il poliedro delle soluzioni ammissibili non sia vuoto l'origine ne è sicuramente un vertice.)
Il metodo del simplesso può quindi partire dall'origine.

Io offro (0,0) con cui porto a casa il valore 0 in termini di funzione obiettivo, certificandolo (il certificato è (0,0) la cui ammissibilità può essere verificata da un King Arthur) 

chi offre di più?

compagno offre la soluzione (1,0):
(1,0) --> 3 > 0   fantastik!

chi offre di più?

Anzi, spetta n'attimo:

avevamo detto che il metodo del simplesso si sarebbe mosso di vertice in vertice eppure con (1,0) non siamo nemmeno in un vertice, il che è strano perchè sappiamo che esiste sempre un vertice che attiene l'ottimo e pertanto, se conosco una direzione di miglioramento, o essa è indefinitamente percorribile (non c'è limite a quanto io possa guadagnare in termini di funzione obiettivo), oppure DEVE ESSERMI POSSIBILE tradurre questo suggerimento del compagno in un nuovo vertice ottimo.

Come fare:

Utilizziamo il suggerimento del compagno (muoversi nella direzione (1,0) )  ma spingiamo a paletta:
(t,0) --> 3 > 0

condizione:
3t <= 5
2t <= 5

t := 5/3

quindi il nuovo vertice (la nuova soluzione di base ammissibile) è:

(x,y) = (5/3,0) e vale 5. Fantasik! Ehi mamma, guarda: posso guadagnare 5. E il certificato è (5/3,0) se non mi credi.

Bella la vita, no?

Chi offre di più?

Mh...

Ma no, di più non si può fare perchè la x (con coefficiente nella funzione obiettivo positivo)
è spinta al massimo valore possibile (il fatto che x <= 5/3 disegue facile dal primo vincolo, dato che y è non-negativa),
mentre la y (che invece ha coefficiente negativo) è tenuta al minimo valore possibile.
Ma allora siamo all'ottimo e sò anche convincermene. Respiro aria di buona caratterizzazione.

Bella la vita, no?

__________________________________________________
Ma prima di gasarci troppo consideriamo altro esempio, da quì in poi facciamo che il nostro problema fosse stato:

max 3x -2y <= 3x (dato che y è non-negativa) dove 

   3x + 2y <= 5
   2x + 3y <= 5
   x,y >= 0

Notare che avremmo potuto fare esattamente gli stessi passi e trovarci ora con la soluzione/certificato di SI:

(x,y) = (5/3,0) e vale 5. Fantasik! Ehi mamma, guarda: posso guadagnare 5. E il certificato è (5/3,0) se non mi credi.

Ma ovviamnete siamo a corto di certificato di NO. Perchè?

Perchè non siamo all'ottimo, come potrebbe mamma dirti che nella vita non c'è niente di meglio? C'è invece il punto (1,1) la fuori ancora da raggiungere.

Cerciamo di andare in cerca di miglioramente, sempre col braccio legato dietro la schina, sempre coi nostri paraocchi di protenzione ben indossati.

Ahi ...

Diventa difficile offrire di più se ci incaponiamo a voler modificare il valore di una sola delle due variabili tenendo ferma l'altra, vero?
Eppure non siamo all'ottimo! (Oddio che paura, allora il problema magari si complica e la sua complessità mi esplode in faccia, potrei non essere in grado di dover gestire tutte queste scelte e spazio di manovra prese insieme. Paùrrraaa ... ).

__________________________________________________

Facciamo recap:

sempre in cerca di dove possano esserci le difficoltà e le insidie, siamo passati a considerare un problema più interessante:

max 3x +3y

   3x + 2y <= 5
   2x + 3y <= 5
   x,y >= 0

partiamo pure con (5/3,0) che è un vertice (rispetto al problema dove questo punto era soluzione ottima non ho cambiato il politopo ma solo la funzione obiettivo)
ma questa volta non è ottimo.
Ora faccio fatica a individuare con ragionamento elementare (modificando il valore di una sola variabile) una direzione di miglioramento.
Come mai? Cosa è cambiato?

All'inizio (per la soluzione di base = origine)

|-----O x (x3 di bonus)

|-----O y (x3 di bonus)

Ora:

   O  x
  /       (può spostarsi in entrambe le direzioni)
|/     

|-----O y (x3 di bonus)


Quindi prima tutte le mie variabili erano a zero ed avrei potuto muoverle solo in una direzione, il che in principio mi consentiva di muoverle una alla volta e scomporre così in al più n passi il percorso che portava a casa il guadagno in termini di funzione obiettivo.

Eppure c'è qualcosa che non mi convince:

in che modo un vertice di un politopo (l'origine) è diverso dagli altri.
I vertici di un politopo, se lo considero come un oggetto geometrio, tutti uguali sono.
Forse non stò ancora guardando al problema dalla giusta prospettiva, con la giusta ampiezza.

_______________

IL giro di boa: la soluzione viene con l'introduzione delle variabili di slack ed il salire dallo spazio ad n dimensioni a quello a m+n dimensioni.
Tutte le variabili sono uguali (Orwell, la fattoria degli animali).
_______________

max 3x -2y

   3x + 2y + s1 = 5
   2x + 3y +s2 = 5
   x,y >= 0

Sottospazio (S) definizione variabili di slack:
s1 = 5 - 3x -2y
s2 = 5 - 2x + 3y

Il nostro spazio è ora quello delle quadruple
(x,y,s1,s2) >= 0

soggete agli iperpiani di definizione delle variabili di slack:

*:
s1 = 5 - 3x -2y
s2 = 5 - 2x + 3y

inizialmente (0,0,5,5) x ed y erano pulite e quindi andava bene che x ed y erano le  variabil indipendenti nella scrittura (*).

Ora (5/3,0,0,5/3) sono pulite la y e la si.
Il nostro lavoro (pivot) è pertanto riscrivere il sottospazio (S) in termini della s1 e della y come variabili indipendenti (pulite).

________________________

