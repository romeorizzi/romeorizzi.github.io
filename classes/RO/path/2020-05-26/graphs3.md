# GRAFI

Ho aggiunto al CMS i seguenti problemi in ambito grafi:

1. `tecla`: buona caratterizzazione di grafo bipartito.

2. `mappa`: la visita BFS. Molti algoritmi in ambito grafi vanno intesi come meta-algoritmi archetioali, non è detto che poi il grafo implicitamente presente vada necessariamente esplicitato.

3. `matita`: la buona caratterizzazione di Eulero che segnò la nascita della teoria dei grafi.
mst: sai calcolare un albero ricoprente di peso minimo?

4. `longwalk`: directed acyclic graphs (DAGs) sono una sottoclasse di grafi dove molti problemi NP-completi diventano invece risolvibili con la Programmazione Dinamica. I DAGs sono in pratica i partial orders.

# GRAFI EULERIANI (Leonhard Euler (1736). "Solutio problematis ad geometriam situs pertinentis". Comment. Acad. Sci. U. Petrop 8, 128–40.)

[Pagina su Wikipedia al problema dei 7 ponti](https://en.wikipedia.org/wiki/Seven_Bridges_of_K%C3%B6nigsberg)

[Motivazioni e collegamento coi loci (geometria situs) di Gottfried Wilhelm Leibniz](https://www.maa.org/press/periodicals/convergence/leonard-eulers-solution-to-the-konigsberg-bridge-problem)

---

# GRAFI PLANARI

Abbiamo visto come lo studio dei grafi planari sia stato motivato dal problema dei 4 colori.

Deletion e contraction. Grafo duale. Formula di Eulero.

Quando la teoria dei grafi si è reincontrata con la topologia
dando nascita alla topologia algebrica (o combinatorica)

1930, teorema di Kuratowski

tre casette e tre porcellini, riuscite a tracciare le $9$ strade (da ogni porcellino ad ogni casetta) senza che si incrocino nel piano?

$K_{3,3}$ può essere disegnato nel piano in modo che gli archi non abbiano punti in comune se non gli estremi?

$K_5$ è il grafo completo di $5$ nodi. (Quindi $10$ archi)
$K_k$ è il grafo completo di $k$ nodi.

$K_{a,b}$ è un grafo di $a$ maschietti e $b$ femminucce con tutti gli archi maschio-femmina ($a*b$ archi).

$K_5$ può essere disegnato nel piano in modo che gli archi non abbiano punti in comune se non gli estremi?

_______________

_Utilizziamo la formula di Eulero per dimostrare che $K_{3,3}$
è un grafo non planare._

Il $K_{3,3}$ è un grafo (bipartito completo) con $n=3+3=6$ nodi e $m = 3\cdot 3 = 9{5 \choose 2} = 9$ archi.
Qualora il $K_{3,3}$ ammettesse un planar embedding, esso dovrebbe avere $f = m - n + 2 = 5$
facce per la formula di Eulero. Ciascuna di queste facce dovrebbe essere contornata de almeno $4$ archi,
visto che:

1. ogni ciclo di $K_{3,3}$ ha un numero pari di archi dato che $K_{3,3}$ è bipartito;

2. nessun ciclo di $K_{3,3}$ consta di due soli archi dato che il $K_{3,3}$ non ha archi paralleli.

Vero che ogni arco pu\`o servire a contornare $2$ facce (contorna le due facce che separa),
ma resta il fatto che ne seguirebbe l'assurdo $20 = 2m \geq 3f = 21$.

**dimostrazione~2 (senza disturbare la formula di Eulero)**
I nodi del $K_{3,3}$ sono partizionati in due gruppi:
chiamiamo $a$,$b$,$c$ i tre maschietti e $u$, $v$, $z$ le tre femminucce.
Disegnamo nel piano il quadrato $aubv$, esso è una curva chiusa e semplice, cioè una circonferenza. I due maschietti e le due femminucce si alternano lungo questa circonferenza. Tra i due maschietti dobbiamo aggiungere una corda (che deve anche passare per un punto dove si colloca la terza femminuccia $z$) mentre tra le due femminucce dobbiamo aggiungere una corda (che deve anche passare per un punto dove si colloca il terzo machietto $c$).
Di queste corde una è riposta dentro e l'altra fuori della circonferenza, data l'alternanza evidenziata sopra.
Eppure nel $K_{3,3}$ anche i nodi $c$ e $z$ sono direttamente collegati tra di loro tramite un arco che ancora non abbiamo saputo embeddare nel piano.

____________________

_Utilizziamo la formula di Eulero per dimostrare che $K_5$
è un grafo non planare._

Il $K_5$ è un grafo (completo) con $n=5$ nodi e $m = {5 \choose 2} = 10$ archi.
Qualora il $K_5$ ammettesse un planar embedding, esso dovrebbe avere $f = m - n + 2 = 7$
facce per la formula di Eulero. Ciascuna di queste facce dovrebbe essere contornata de almeno $3$ archi,
visto che il $K_5$ non ha nè archi paralleli nè loops.
Vero che ogni arco pu\`o servire a contornare $2$ facce (contorna le due facce che separa),
ma resta il fatto che ne seguirebbe l'assurdo $20 = 2m \geq 3f = 21$.

**dimostrazione~2 (senza disturbare la formula di Eulero)**
Chiamiamo $a$,$b$,$c$,$d$ ed $e$ i $5$ nodi del $K_5$.
Anche in questa dimostrazione assumiamo di avere un embedding del $K_5$
e cerchiamo una contraddizione. I tre archi del triangolo $a,b,c$ formeranno una curva chiusa e semplice, con una regione esterna ed una interna ad essa. I nodi $d$ ed $e$non possono cadere uno nella regione interna ed uno in quella esterna poichè l'arco $ed$ dovrebbe allora scavalcare la linea chiusa $a,b,c$. Assumiamo senza perdita di generalità che $d$ ed $e$ cadano entrambi nella regione interna.
Siccome $d$ cade internamente, i tre archi $da$, $db$ ed $dc$ separano tale regione interna in tre regioni:

  1. quella contornata dalla linea chiusa $d,a,b$ lascia esterno il nodo $c$;

  2. quella contornata dalla linea chiusa $d,b,c$ lascia esterno il nodo $a$;

  3. quella contornata dalla linea chiusa $d,c,a$ lascia esterno il nodo $b$.

Ora, in qualsiasi di queste tre sottoregioni decida di cadere il nodo $e$, come potrà essere poi tracciato senza incroci l'arco che lo congiunge col nodo situato fuori da essa?

**dimostrazione~3.**
Nell'embedding di $K_5$ il ciclo Hamiltoniano sui suoi nodi $a,b,c,d,e$
è naturalmente mappato su una curva chiusa e semplice composta dai $5$ archi tra ogni due nodi ciclicamente consecutivi. Restano da rappresentare altri $5$ archi, e, senza perita di generalità, possiamo dedurne che almeno $3$ di essi saranno mappati nella regione interna alla curva $a,b,c,d,e$. Si noti che almeno $2$ di questi $3$ archi, $A_1$ ed $A_2$, non hanno alcun estremo in comune dato che gli archi del $K_5$ non ricompresi nel ciclo Hamiltoniano costituiscono un secondo ciclo Hamiltoniano del $K_5$. Pertanto, quando si cammina lungo la curva $a,b,c,d,e$ succede che gli estremi di questi archi si alternano:
senza perdita di generalità, stiamo parlando degli archi $ac$ e $bd$.
Ed è chiaramente impossibile essi siano tracciati entrambi nella regione interna alla curva $a,b,c,d,e$ senza incrociarsi tra loro.
