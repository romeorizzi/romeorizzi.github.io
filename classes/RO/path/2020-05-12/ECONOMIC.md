INTERPRETAZIONE ECONOMICA
L'interpretazione economica è sempre parte della teoria della dualità della quale offre reinterpretazioni rivestendo le variabili duali di sugo (ad esempio le rinomina "prezzi ombra"). Un sugo sempre pronto per un condimento da reinventarsi ogni volta con l'aggiunta di ingredienti freschi.
Nella dispensa trovi due esempi di interpretazione economica.

RICHIAMI SULLA DUALITA':

Dato il problema primale P:
max c'x
Ax <= b
x >= 0

Ed il suo duale D:
min b'y
A'y >= c
y >= 0

Il Weak Duality Theorem afferma:

Data una qualsiasi soluzione ammissibile x del problema P ed una qualsiasi soluzione ammissibile y del problema D. Allora vale che c'x <= b'y.

_________________

Lo Strong Duality Theorem (ossia la buona caratterizzazione) afferma:

Se il primale ha soluzione ottima x^+ allora anche il duale ha soluzione ottima y^-, e c'x^+ = b'y^-.

RUNNING EXAMPLE:

PROBLEMA PRIMALE DI PARTENZA:

max 4x1 +x2 +3x3
   x1 + 4x2       <= 1
  3x1 + -x2  +x3  <= 3
   x1,x2,x3 >= 0

PRIMO TABLEAU:

   |  - | x1 | x2 | x3 |
___|____|____|____|____|
z  |  0 |  4 |  1 |  3 |
s1 |  1 | -1 | -4 |  0 |
s2 |  3 | -3 |  1 | -1 |

SAI LEGGERE LA SOLUZIONE DI BASE ASSOCIATA?


ULTIMO TABLEAU:

   |  - | x1  | w1 | w2 |
___|____|_____|____|____|
z  |  10| -6  | -1 | -3 |
x2 | 1/4|-1/4 |-1/4|  0 |
x3 |13/4|-13/4|-1/4| -1 |

PERCHE' QUESTO E' L'ULTIMO?
(answ: perchè -6, -1, -3 sono tutti e tre <= 0).

SAI LEGGERE LA SOLUZIONE DI BASE ASSOCIATA?
E' ESSA DEGENERE?

SAI ANCHE LEGGERE LA SOLUZIONE DUALE ASSOCIATA?
E' ESSA DEGENERE?

Competenza: estrazione delle soluzioni di base da un tableau
La lettura avviene in due fasi (prima le variabili in fuori base poi quelle in base)
SOLUZIONE PRIMALE ESTESA:

(x1, x2,  x3,w1,w2, z)
( 0,  ?,   ?, 0, 0, ?) <-- variabili non in base a zero
( 0,1/4,13/4, 0, 0,10) <-- varibili in base univocamente determinate di conseguenza (e, di, fatto, le trovo nella prima colonna)

Nota: questa soluzione per P è ammissibile perchè rispetta tutti i vincoli di non negatività (sia per le n variabili di decisione originarie che per quelle di slack).

Nota: questa soluzione per P è ottima perchè i costi ridotti (-6, -1, -3) nella riga etichettata z erano tutti e tre <= 0. Come la teoria della dualità ci ha offerto una seconda (o forse prima) interpretazione per questi numeri, l'interpretazione economica ne offrità una seconda, e parimenti offre anche una reinterpretazione dei numeri (1/4,13/4) nella colonna dei termini noti (che lasciamo a tè di scoprire procedendo in modo analogo o duale a quanto quì sotto).

Nota: siccome tutte le variabili in base risultano essere strettamente > 0,
allora la soluzione primale è non degenere.
Questo implica che il certificato di ottimalità sarà univoco dato che i vincoli su cui poggiamo sono in numero appena sufficiente.

COME LEGGERE LA SOLUZIONE DUALE?

Volendo farla lunga ma lunga, ricordiamoci che anti-traspostando il tableau finale che esprime la soluzione primale ammissibile ed ottima,
si ottiene il tableau duale che esprime la soluzione duale (ottima ed ammissibile) ad essa ortogonale.

IL TABLEAU DUALE ALL'OTTIMO E' PERTANTO:

   |  - | s2 | s3  |
___|____|____|_____|
d  |-10 |-1/4|-13/4|
s1 |  6 | 1/4| 13/4|
y1 |  1 | 1/4| 1/4 |
y2 |  3 |  0 |   1 |

Da cui la soluzione duale può essere letta con le stesse due fasi viste sopra (ma a questo punto dovresti essere in grado di leggerla direttamente prima della anti-traspostazione).

SOLUZIONE DUALE ESTESA:

(y1,y2,s1,s2,s3, d)
( ?, ?, ?, 0, 0, ?) <-- variabili non in base a zero
( 1, 3, 6, 0, 0,10) <-- varibili in base univocamente determinate di conseguenza (e, di, fatto, le trovo nella prima colonna)

Per effettuare la lettura diretta basta rimanere ben consapevoli della corrispondenza biunivoca che vige tra variabili primali (di decisione vere e di slack) e variabili duali (di surplus e moltiplicatori veri) e leggere la prima colonna invece che la prima riga, ricordandosi di ignorare il segno di -.

IL CERTIFICATO DI OTTIMALITA' (tale soluzione duale) POSTO IN AZIONE E' PERTANTO:

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

SE VUOI SAPERE DI PIU' IN MERITO AI CERTIFICATI DI OTTIMALITA' E LORO EVENTUALE RICOSTRUZIONE RIMANDIAMO AL TEOREMA DEGLI SCARTI COMPLEMENTARI.

OGGI ACCENNIAMO INVECE ALL'INTERPRETAZIONE ECONOMICA E CHIUDIAMO CON LA PARTE DEL CORSO DEDICATA ALLA PL.

-------------

INTERPRETAZIONE ECONOMICA

Nota: siccome tutte le variabili primali in base all'ottimo risultano essere strettamente > 0 (ossia la soluzione primale è non degenere),
allora, come già osservato, la soluzione duale è unica (è lei).
Rischia pertanto di avere un significato molto chiaro.

Per comprendere ed interpretare questo significato (che è talvolta importante saper riscoprire pur rimanendo nella teoria ormai assodata) due approcci sono efficaci:

1. APPROCCIO PRIMO. Analisi dimensionale:

Analizziamo dimensionalmente le quantità che giocano nel problema (P):
z = max c'x
Ax <= b
x >= 0

x = unità di prodotto per ogni tipo (auto, biciclette, automobili)
c = dollaroni/unità di prodotto
b = unità di risorsa delle varie tipologie (viti, bulloni, molle)
z = me mi interessa solo i soldi (dollaroni)

A = b/x = [unità di risorsa]/[unità di prodotto]

Ma noi ci preme analizzare dimensionalmente le misteriose quantità
del problema (D):

d = min b'y
A'y >= c
y >= 0

y = c/A = [dollaroni/unità di prodotto]/[[unità di risorsa]/[unità di prodotto]] = [dollaroni/unità di risorsa]
cioè gli y dovrebbero avere un significato di valore economico delle risorse

prendiamo conferma:

visti i due teoremi della dualità forte e debole,
sospetto che d=z valga non solo numericamente, ma anche dimensionalmente.

sarebbe allora d = [dollaroni]

In effetti, d = b'y ci dice che:

[dollaroni] = [unità di risorsa] * [dollaroni/unità di risorsa]

Vedremo che questa intuizione (y ha il significato di valore monetario delle risorse) è quì sostanzialmente vera, modulo una certa primissima
POSTILLA IMPORTANTE: i coefficienti c nella funzione obiettivo siano i valori AL NETTO dei vari prodotti, ossia il valore di mercato a cui riesco a vendere i prodotti, tolti però tutti i costi di produzione inclusi i valori di mercato delle materie prime che trovano impiego nella realizzazione di ciascuna unità del prodotto.


2. APPROCCIO SECONDO. Studio di un problema alterato di (P) (oggetto di interesse dell'analisi di sensitività):

Al problema primale P:
max c'x
Ax <= b
x >= 0

Associamo il problema alterato P(t):
max c'x
Ax <= b + t
x >= 0

Un teorema che dischiude l'interpretazione economica sarebbe il seguente:

Teorema:
Assumi che la soluzione primale ottima x^+ sia non degenere,
ossia che il duale abbia un'unica soluzione ottima y^- (essa è, e quindi grondante di sugo).
Allora vale che esiste un intorno dell'origine B(0) tale che,
per ogni t\in B(0):

max(P(t)) = max(P) + \sum_{i=1}^m y^-_i t_i

ESERCIZIO (se ci giochi per bene in realtà vedi anche come dimostrarti da tè il teorema):

RIPRENDIAMO IL SOLITO PROBLEMA (RUNNING EXAMPLE):

Posso fabbricare automobili, biciclette elettriche, elicotteri (servono bulloni e molle che ho in magazzino (ma potrei vendere separatamente al loro prezzo di mercato, e tale prezzo lo ho scalato dovutamente dai coefficienti della funzione obiettivo ottenendo i coefficienti 4,1,3 dell'esercizio).
La numerosità di bulloni e molle in magazzino è data da (b1,b2) = (1,3):

Problema P                       Problema P(t)
max 4x1 +x2 +3x3                 max 4x1 +x2 +3x3
   x1 + 4x2       <= 1              x1 + 4x2       <= 1 + t1
  3x1 + -x2  +x3  <= 3             3x1 + -x2  +x3  <= 3 + t2
   x1,x2,x3 >= 0                    x1,x2,x3 >= 0

Ora, sappiamo che il tableau primale all'ottimo per P era:

   |  - | x1  | w1 | w2 |
___|____|_____|____|____|
z  |  10| -6  | -1 | -3 |
x2 | 1/4|-1/4 |-1/4|  0 |
x3 |13/4|-13/4|-1/4| -1 |

COMPETENZA 1 (leggere i certificati di ottimalità da questo tableau):

I moltiplicatori magici che ci servono altro non sono che le variabili non nulle del duale:

y1 = 1, è moltiplicatore del primo vincolo primale per il certificato di ottimalità e moltiplicatore della reazione vincolare esprimibile dal vincolo per la creazione dell'anti-gravità (chiamo così l'opposta del gradiente della funzione obiettivo).  
y2 = 3, è moltiplicatore del primo vincolo primale per il certificato di ottimalità e moltiplicatore della reazione vincolare esprimibile dal vincolo per la creazione dell'anti-gravità.
s1 = 6, forse già più opzionale ma è il moltiplicatore da riservare al vincolo di non-negatività x1 >= 0 se si vuole che quanto impastato vada a costruire fedelmente il gradiente della funzione obiettivo.

COMPETENZA 2 (leggere i prezzi ombra da questo tableau):

In breve:

Per un qualche intorno della soluzione ottima, quanto saresti disposto a pagare, oltre al suo valore di mercato,
per ogni bullone? Risposta: 1 euro.

Per un qualche intorno della soluzione ottima, quanto saresti disposto a pagare, oltre al suo valore di mercato,
per ogni molla? Risposta: 3 euro.

Ossia, in lungo:
y1 = 1, non solo è moltiplicatore per il certificato di ottimalità e moltiplicatore della reazione vincolare esprimibile dal vincolo per la creazione dell'anti-gravità (chiamo così l'opposta del gradiente della funzione obiettivo) ma (dalla meccanica razionale o dalla scienza delle costruzioni o forse anche da fisica) esprime anche il "guadagno energetico", in termini di funzione obiettivo, al cedere unitario di quel vincolo. Quindi è il prezzo ombra del bullone, ossia quanto in più rispetto al suo valore di mercato sarei disposto a pagare il singolo bullone.  
y2 = 3, analogamente, è il prezzo ombra della singola molla, ossia quanto in più rispetto al suo valore di mercato sarei disposto a pagare per quella molla in più (almeno in parte, perchè comprarla tutta intera a quel prezzo potrebbe già essere troppo).



COMPETENZA 3:

E fino a dove saresti disposto a pagare un tale sovrapprezzo?

Devo ora computare innanzitutto il tableau del problema P(t) per la stessa partizione di variabili in base e fuori base.

Niente paura che P(t) contiene dei valori simbolici. Essi saranno per altro confinati nella colonna dei termini noti
(dato che sapete che pivotare è tutto riducibile ad operazioni di riga su una qualche matrice con m+n+1 colonne).

IL TABLEAU PRIMALE ALL'OTTIMO ERA:


   |  - | x1  | w1 | w2 |
___|____|_____|____|____|
z  |  10| -6  | -1 | -3 |
x2 | 1/4|-1/4 |-1/4|  0 |
x3 |13/4|-13/4|-1/4| -1 |

In base a quanto osservato sopra sul confinamento dei simboli t1 e t2
Si noti che P è un caso particolare di P(t), che si dovrebbe riottenere come P(t=0).
Quindi, il tableau di P(t) associato a quel "vertice" avra la forma:


   |  - | x1  | w1 | w2 |
___|____|_____|____|____|
z  |  ? | -6  | -1 | -3 |
x2 |  ? |-1/4 |-1/4|  0 |
x3 |  ? |-13/4|-1/4| -1 |

Dobbiamo quindi ricalcolare solo i valori "?", e ripeto che la partizione è già nota.
Siccome tutti questi valori sono disposti su una stessa colonna, possiamo sfruttare la prova del 9 che ci dà una condizione per ogni riga.

Ci serve una soluzione qualsiasi valida per il primo tableau:

PROBLEMA PRIMALE ESTESO P(t):

max 4x1 +x2 +3x3
   x1 + 4x2       <= 1 + t1
  3x1 + -x2  +x3  <= 3 + t2
   x1 + x2        <= 3
   x1,x2,x3 >= 0


PRIMO TABLEAU:

   |  -    | x1 | x2 | x3 |
___|_______|____|____|____|
z  |  0    |  4 |  1 |  3 |
w1 |  1 +t1| -1 | -4 |  0 |
w2 |  3 +t2| -3 |  1 | -1 |

LEGGO UNA QUALSIASI SOLUZIONE (CONVIENE QUELLA DI BASE CHE SI LEGGE CHE E' UN LUSSO E QUESTA VOLTA TUTTI QUEGLI ZERI NON COSTITUISCONO ALCUN RISCHIO):

x1 = x2 = x3 = 0
w1 = 1 +t1
w2 = 3 +t2
z = 0

USO TALE SOLUZIONE PER IMPOSTARE LE CONDIZIONI DELLA PROVA DEL NOVE:

            (0) (1+t1) (3+t2)
      |  - | x1  | w1  | w2 |
_______|____|_____|_____|____|
(0) z  |  ? | -6  | -1  | -3 |
(0) x2 |  ? |-1/4 |-1/4 |  0 |
(0) x3 |  ? |-13/4|-1/4 | -1 |


Riga x2:
   0 = ?  -1/4(0) -1/4(1+t1) +0(3+t2) --> 0 = ? -1/4 -1/4t1  --> ? = 1/4 + 1/4t1
Riga x3:
   0 = ? -13/4(0) -1/4(1+t1) -1(3+t2) --> 0 = ? -1/4 -1/4t1 -3-t2 --> ? = 13/4 +1/4t1 +t2
Riga z:
   0 = ?    -6(0)   -1(1+t1) -3(3+t2) --> 0 = ? -1-t1 -9-3t2 --> ? = 10 +t1 +3t2



   |  -               | x1  | w1 | w2 |
___|__________________|_____|____|____|
z  | 10 + 1t1 + 3t2   | -6  | -1 | -3 |
x2 |  1/4 + 1/4t1     |-1/4 |-1/4|  0 |
x3 | 13/4 + 1/4t1 +t2 |-13/4|-1/4| -1 |


Per altro a questo punto troviamo ulteriori conferme:

Si noti che P è un caso particolare di P(t), che si dovrebbe riottenere come P(t=0).
Quindi otteniamo conferma sulla componente non-simbolica della colonna (10=10,1/4=1/4,13/4=13/4).

Nota: abbiamo trovato una soluzione parametrica che ci assicura di portare a casa almeno z = 10 + 1t1 + 3t2,
ossia 10 + y^-_1t1 + y^-_2t2, ossia siamo in effetti disposti a pagare i prezzi ombra in sovrapprezzo sul valore di mercato
di molle e bulloni, dato che questa soluzione sarà ammissibile almeno per piccoli valori di t1 e t2, dato che 1/4 e 13/4 sono entrambi strettamente maggiori di zero (e quindi ho sempre dello spazio prima di mangiarmeli completamente).
Questo certificato di SI è metà della proof del teorema sopra. Per l'altra metà ci serve un certificato di NO, che deve quindi venire da una struttura del duale. Quì la cosa è ancora più semplice in quanto il vecchio certificato di ottimalità (y^-_1,y^-_3) = (1,3) non ha perso di validità (si rifletta anche geometricamente) e quindi può essere utilizzato per comprovare che l'incremento della funzione obiettivo all'ottimo non potrà mai eccedere il termine additivo + 1t1 + 3t2.


LA DOMANDA CHE SPESSO SI PONE NEI TEMI E NELLE APPLICAZIONI E' FINO A DOVE TALE SOLUZIONE PARAMETRICA RESTA AMMISSIBILE.
Come rispondere a tale domanda?

In breve: fino a quando la soluzione parametrica preserva ammissibilità.
In realtà, di tale soluzione parametrica va controllata la sola non negatività (ovviamente di tutte le componenti della soluzione estesa).

Condizione non-negatività della x2:
1/4 + 1/4t1 >= 0

Condizione non-negatività della x3:
13/4 + 1/4t1 +t2 >= 0

Ricordo che in realtà il vettore t ci piace studiarlo anche fuori dal primo quadrante (ossia il manager
  dell'azienda potrebbe essere interessato non solo ad acquisire ulteriori materie prime, ma anche a rivenderle direttamente
  sul mercato, almeno per parte di quanto in giacenza in magazzino).
Queste condizioni quì sopra tipicamente ti mettono un tetto (anche dall'alto) sulla quantità di risorsa aggiuntiva
che saresti disposto ad acquistare con prezzo di mercato maggiorato del prezzo ombra.
Ma non è detto che questo tetto superiore debba sempre esserci. (Ricordate però che nelle applicazioni dovete sempre guardare con sospetto ai guadagni infiniti, quantomeno dovete porvi la questione se non sia il caso di andare a comporre un modello più ampio della problematica in esame.)
In questo caso non vi è alcun tetto superiore, e da quel lato non avrei nulla da aggiungere.

Ma queste condizioni sempre mettono un tetto dal basso (prima o poi andrà ad esaurirsi il magazzino).
In questo caso:

Dalla prima condizione: t1 >= -1  (combacia per altro con l'esaurimento dei bulloni in magazzino)

Dalla seconda condizione: 1/4t1 +t2 >= -13/4
che, se consideriamo la sola t1 (t2=0, stiamo variando una sola cosa alla volta) diviene:
t1 >= -13. Direi che, nostro mal grado, dobbiamo fermarci prima a t1=-1 dove, come detto sopra, esauriamo i bulloni da vendere.

se consideriamo la sola t2 (t1=0) diviene:
t2 >= -13/4
Quando t2=-13/4 b2=0 e stiamo costrundo 1/4 di bici elettrica (col quale processo mi si rigenera 1/4 di molla riciclata,
  grazie alla quale faccio elicotteri)


-------------------------------------------------

ABBIAMO DECISO CHE VOGLIAMO STUDIARE UN PROBLEMA PRIMALE CON UN VINCOLO AGGIUNTO:

CONVIENE FARE UNA OTTIMIZZAZIONE A CALDO:

IL TABLEAU PRIMALE ALL'OTTIMO ERA:


   |  - | x1  | w1 | w2 |
___|____|_____|____|____|
z  |  10| -6  | -1 | -3 |
x2 | 1/4|-1/4 |-1/4|  0 |
x3 |13/4|-13/4|-1/4| -1 |

SICCOME NOI VOGLIAMO AGGIUNGERE UN VINCOLO,
PREFERIAMO RAGIONARE SULLA SOLUZIONE DUALE (DOVE STIAMO AGGIUNGENDO UNA VARIABILE):

COMPETENZA PASSO AL DUALE:

   |  - | x1  | w1 | w2 |
___|____|_____|____|____|
z  |  10| -6  | -1 | -3 |
x2 | 1/4|-1/4 |-1/4|  0 |
x3 |13/4|-13/4|-1/4| -1 |

COMPETENZA AGGIUNGO UNA VARIABILE (INIZIALMENTE NULLA, QUINDI UNA COLONNA):

COMPUTO LA COLONNA CON LA PROVA DEL NOVE (PER RIGA CHE GIA' ABBIAMO VISTO).
