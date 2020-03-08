# Informazioni utili sul linguaggio di programmazione consigliato

Uno degli obiettivi che si prefigge il corso è di far acquisire anche competenze pratiche agli studenti, molto utili per essere autonomi.
Per perseguire questo obiettivo, in parallelo alle lezioni di teoria è fondamentale applicare 
le conoscenze acquisite sperimentando con le proprie mani come implementare efficacemente gli algoritmi studiati.

Il corso offre una piattaforma, chiamata CMS (Contest Management System) che ha la funzione di permettere agli studenti di scrivere
codice per risolvere dei problemi proposti di natura algoritmica.
Questo sistema sarà anche utilizzato per verificare le competenze acquisite nell'esame finale, quindi è importante iniziare fin da subito
a prendere dimestichezza, per ottenere il massimo risultato dal corso.

I linguaggi supportati dal portale sono 3: C, C++ e Python.

Molti di voi avranno di sicuro dimestichezza con C e Python, però sono propenso a consigliarvi di utilizzare il C++ rispetto agli altri due, 
perchè offre molte comodità che vi saranno utili nella risoluzione dei problemi.

Una nota riguardo a Python: il problema principale è che il CMS non distingue gli errori di compilazione da quelli di esecuzione 
(perchè Python è un linguaggio interpretato), perciò all'esame e durante le esercitazioni può capitare che non riusciate a capire perchè il
programma non funziona, ad esempio perchè la versione Python installata nel vostro pc è diversa da quella in esecuzione sul server delle valutazioni. 

Le competenze di C++ richieste non si discostano molto da quanto già sapete di C, 
infatti non è necessario saper utilizzare in modo avanzato le caratteristiche più complesse del C++, quali classi, ereditarietà e template.

Il motivo per cui vi consiglio C++ è la sua libreria STL, acronimo di Standard Template Library.
È una libreria che per molte caratteristiche è simile a quella di Java, 
in quanto offre funzioni per manipolare gli array (quali sort, ricerca binaria, ecc...) e contenitori per immagazzinare e ricercare in modo efficiente i dati.

Per chi è interessato ad approfondire il linguaggio, propongo dei link utili:  
https://www.w3schools.com/cpp/ -> corso di c++ che copre anche le basi.  
https://www.tutorialspoint.com/cplusplus/cpp_stl_tutorial.htm -> introduzione molto veloce alla STL.  
https://www.geeksforgeeks.org/containers-cpp-stl/ -> schema dei container STL.  
https://www.cplusplus.com/reference/stl/ -> documentazione completa della libreria standard c++. Consiglio solo di imparare a consultarla, di quello che contiene all'esame vi serve solo la punta dell'iceberg, e per questo sarà tra i materiali consultabili. 
https://www.hackerrank.com/ -> sito che propone varie challenge algoritmiche, simili a quelle affrontate nel corso.  
https://training.olinfo.it/#/overview -> portale ufficiale delle olimpiadi di informatica, 
ha molti problemi molto simili a quelli del corso, ed utilizza la stessa piattaforma (CMS) per valutare i problemi.

Di seguito un breve elenco dei componenti più utili della STL, che utilizzeremo durante il corso:
# Iteratori
Ogni container, dal più semplice al più complesso, si può scorrere utilizzando gli iteratori:


	// Header per le funzioni di input/output da console (cin e cout)
	#include <iostream>
	// Header per il container vector
	#include <vector>

	// Alternativamente, anzichè ricordarsi a memoria (o guardare nella documentazione) tutti gli header,
	// in linux (e quindi anche durante l'esame) è possibile includere questo header che include tutti i possibili
	// header stl, risparmiando quindi tempo prezioso a scrivere manualmente tutti gli #include 
	// ATTENZIONE: Non funziona su MAC e Windows
	#include <bits/stdc++.h>

	// L'stl è nel namespace std, se omettiamo questa riga
	// ogni funzione o container dell'stl deve essere preceduta da std::
	// ad esempio std::vector<int>
	using namespace std;

	int main() {

		// Dichiaro un vettore, è in container più semplice, molto simile alle liste Python e alle ArrayList Java.
		vector<int> test = {1, 2, 3};

		// Assegno alla variabile it un iteratore al primo elemento dell'array
		vector<int>::iterator it = test.begin();

		// Scorro l'array test, stampando i suoi elementi:
		while (it != test.end()) {
			// Cout è l'analogo del printf del C, stampa tutte le variabili scritte, che vanno separate da << (endl è equivalente a '\n')
			// *it accede al valore contenuto nella cella a cui it si riferisce 
			cout << *it << endl;
			// printf("%d\n", test); // Alternativamente anche in C++ è possibile usare la sintassi C per stampare a schermo.
			// Incremento l'iteratore, passando all'elemento successivo
			++it;
		}
	}


Gli iteratori sono praticamente equivalenti ai puntatori, infatti, sostituendo al vettore un normale array C, il codice cambia poco:


	int main() {

			int test[] = {1, 2, 3};

			// Assegno alla variabile it un puntatore al primo elemento dell'array
			int *it = &test[0];

		// Puntatore alla fine dell'array
		int *end = test + 3;

			// Scorro l'array test, stampando i suoi elementi:
			while (it != end) {
					// Cout è l'analogo del printf del C, stampa tutte le variabili scritte, che vanno separate da << (endl è equivalente a '\n')
					// *it accede al valore contenuto nella cella a cui it si riferisce
					cout << *it << endl;
					// printf("%d\n", test); // Alternativamente anche in C++ è possibile usare la sintassi C per stampare a schermo.
					// Incremento il puntatore, passando all'elemento successivo
					++it;
			}
	}


Un modo rapido per scorrere un contenitore è utilizzando un ciclo for specializzato del C++:


	int main() {
		vector<int> test = {1, 2, 3};
		for (int x : test) {
			cout << x << endl;
		}
	}


Questo sistema funziona per tutti i container, ma non per gli array C (è una delle differenze tra iteratori e puntatori).


# Vettori

I vettori sono i container più semplici, molto simili agli array convenzionali, ma di dimensione variabile.
L'aggiunta e rimozionie degli elementi è simile a quella di uno stack (FIFO), gli elementi saranno quindi aggiunti e rimossi
alla fine, con le funzioni push_back e pop_back.

	#include <vector>
	#include <iostream>
	using namespace std;

	int main() {
		// Creo un vettore di 10 elementi, in automatico sono inizializzati a 0.
		vector<int> vec = vector<int>(10);

		// Aggiungo l'elemento 5 al vettore
		vec.push_back(5);

		// Stampo la dimensione del vettore, sarà 10 + 1 = 11 elementi.
		cout << vec.size() << endl;

		// Stampo l'ultimo elemento del vettore (5).
		cout << vec.back() << endl;
 
		// Elimino l'ultimo elemento
		vec.pop_back();

		// Stampo l'ultimo elemento del vettore, che adesso sarà 0.
		cout << vec.back() << endl;
	}

# Sorting

Una delle operazioni più comuni da fare con una collezione di elementi è l'ordinamento. 
Il C++ mette a disposizione un metodo molto efficente per farlo, attraverso la funzione `sort`:
	
	// sort()
	#include <algorithm>
	#include <vector>
	// greater<int>
	#include <functional>
	using namespace std;

	int main() {
		vector<int> x = {1, 4, 2, 5, 2, 9, 14, 0, -5};
		// Ordino in modo crescente tutti gli elementi del vettore
		sort(x.begin(), x.end());
		// È equivalente a specificare in modo esplicito l'operatore di confronto 'less':
		// sort(x.begin(), x.end(), less<int>());

		// Ordino in modo decrescente tutti gli elementi del vettore, specificando l'operatore di confronto 'greater'
		sort(x.begin(), x.end(), greater<int>());

	}


__WORK IN PROGRESS...__
I materiali in questa unit, se non questo stesso file, verranno aggiornati ogni volta che sarà necessario introdurre dei nuovi strumenti per risolvere i problemi proposti.
Se conoscete delle risorse che potrebbero essere utili a facilitare l'acquisizione delle competenze sul piano della programmazione nella pratica ...



<!-- Map -->

<!-- Set -->

<!-- Queue -->

<!-- Priority queue -->
