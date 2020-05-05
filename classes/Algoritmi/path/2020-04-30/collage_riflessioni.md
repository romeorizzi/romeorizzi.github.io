## Collage --idee raccolte:

Osservazione (stiamo osservando la struttura di una soluzione):

I fogli utilizzati dalla soluzione sono intervalli.
Ha senso che due fogli si overlappino?

Na roba del genere ha senso?
[777777777777777777]
               [555555555]
			   
Non ha molto senso perchè uno dei due è costretto ad infilarsi sotto l'altro ed allora potrei trimmarlo.

(Concetto di soluzione canonica/trimmata/pulita).
Lemma 0: Esiste sempre una soluzione ottima che è canonica (dove gli intervalli non si overlappano).
         Gli intervalli costituiscono una famiglia nested come gli ambiti di validità delle variabili (o di vita delle procedure)
		 nei linguaggi di programamzione.
		 Come le formule di parentesi ben bilanciate.

Congettura: Se primo ed ultimo colore dell'intervallo sono uguali allora
1. esiste una soluzione ottima che mette quei due estremi in un unico foglio,
   e ovviamente questo foglio stà sotto tutto (è la tovaglia).
2. ogni soluzione ottima mette quei due estremi in un unico foglio.
Proof:
Supponiamo che il foglio che contiene il primo ed il foglio che contiene il secondo siano diversi.

Ossia uno odei seguetin casi ...
[7-----------7]    [7---------7]
[7]    [7---------7]
[7-----------7]    [7]
[7]    [7]

Ma non perdiamo generalità a ragionare col primo (eventualmente degenere):
[7-----------7]    [7---------7]



QED




[          ][

X..........X.........
^          ^

o da sola


Osservazione: Se dentro lintervallo istanza compiono consecutivi due colori uguali (XX) allora
quei due colori vanno necessariamente in uno stesso foglio.
Proof:
Si consideri una soluzione dove i due X=7 vanno a finire in due fogli diversi.
               
            ---  <-- non può esserci un foglio a cavallo altrimenti i 7 non li vedrei
-------------7][7-------------------   (con molti altri fogli di cui non parlo.)

Ma allora li posso unire in un unico folgio (tutto di 7) e così ho risparmiato un foglio.

Questa semplice osservazione suggerice un PREPROCEESING lineare dove collasso in un unico elemento elementi consecutivi dello stesso colore.
QED



