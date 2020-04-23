#!/usr/bin/env python3

# Versione 1: O(n) memory, O(n) time
def num_max_panini(t,last_panino_preso_indx):
    assert t >= 0, "num_max_panini precondition: t should be >= 0"
    assert 0 <= last_panino_preso_indx < len(panino_esteso), "num_max_panini precondition: last_panino_preso_indx outside the range"
    # ritorna il massimo numero di panini in una sottosequenza strettamente-decrescente di panino_esteso[t:] in cui primo panino sia < panino_esteso[last_panino_preso_indx].
    if t >= len(panino_esteso):
      return 0
    if panino_esteso[t] >= panino_esteso[last_panino_preso_indx]:
      return num_max_panini(t+1,last_panino_preso_indx)
    return max( num_max_panini(t+1,last_panino_preso_indx), 1+num_max_panini(t+1, t) )

# esercizio 1.1: aggiungere la memoizzazione e vedere la differenza che fà;
# esercizio 1.2: scrivere come una programmazione dinamica;
# esercizio 1.3: ora che sai calcolare l'opt, riesci a ricostruire una soluzione ottima?


# Versione 2: O(n) memory e possibile spingere verso O(n log n) time
def num_max_panini_when_first_is(indx_first):
    assert 0 <= indx_first < len(panino), "num_max_panini_when_first_is precondition: indx_first outside the range"
    # ritorna il massimo numero di panini in una sottosequenza strettamente-decrescente di panino[indx_first:] che abbia proprio panino[indx_first] come suo primo panino
    risp = 1
    for indx_second in reversed(range(indx_first+1,len(panino))):
        if panino[indx_second] < panino[indx_first]:
            risp = max(risp, 1+num_max_panini_when_first_is(indx_second))
    return risp

# esercizio 2.1: aggiungere la memoizzazione e vedere la differenza che fà;
# esercizio 2.2: scrivere come una programmazione dinamica;
# esercizio 2.3: una volta fatto 2.2, provare ad utilizzare una struttura dati per range query dinamiche in modo da abbassare il running time a O(n logn);
# esercizio 2.4: ora che sai calcolare l'opt, riesci a ricostruire una soluzione ottima?

# Versione 3: l'abbiamo solo discussa alla lavagna, quindi molto spazio per tuoi esercizi e  sperimentazioni

# esercizio 3.1: provare a scrivere il codice per la versione 3 (gioco di patient sort dove i panini arrivavano uno alla volta e li collocavamo in bins. I bins erano la chiave per la proof di ottimalità, ossia detenevano il linguaggio del NO per questo problema). In prima battuta va benissimo O(n^2).

# esercizio 3.2: cercare di scrivere tale codice come un algoritmo/codice self-certifying (questo è ora possibile dato che siamo penetrati nel problema sufficientemente a fondo da conoscerne il linguaggio di NO). Questo potrebbe essere visto come un meta-suggerimento che dovrebbe fare parte del vostro bagaglio dei vostri strumenti in ingegneria del software. 

# esercizio 3.3: montarci sopra la ricerca binaria sui top dei bins per portare la complessità a O(n \log k).

# esercizio 3.4: ora che sai calcolare l'opt, riesci a ricostruire una soluzione ottima?
                   
# esercizio 3.5: vedere se sia possibile montare sopra questo approccio al problema specifico il meta-approccio ricorsivo suggerito da Hirshberg, come da noi astrattizzato, per ottenere un algoritmo a RAM O(k) pur mantenendo il running time a O(n \log k).
                   

                   
N = int(input())
panino = []
for _ in range(N):
    panino.append(int(input()))
assert len(panino) == N

panino_esteso = [max(panino)+1] + panino  # = [MAXINT, 3, 5, 2, 5, 7, 8, 4]
print(num_max_panini(1,0))

opt = max([num_max_panini_when_first_is(i) for i in range(len(panino))])
print(opt)

assert opt == num_max_panini(1,0), "cross validation v1 versus v2"
print(f"OK: testcase passed. N={N}, opt={opt}")

""" Se vui sapere di più su come produrre ( ed in tempo O(n log n) ) non solo una longest increasing subsequence ma anche una colorazione col minimo numeri di colori (che si certificano mutualmente in ottimalità) ecco alcune valide sorgenti:

https://en.wikipedia.org/wiki/Patience_sorting
https://www.cs.princeton.edu/courses/archive/spring13/cos423/lectures/LongestIncreasingSubsequence.pdf
http://wordaligned.org/articles/patience-sort
"""
