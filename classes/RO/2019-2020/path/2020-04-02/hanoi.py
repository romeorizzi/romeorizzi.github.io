#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def num_mosse_chiusa(N):
    return 2**N-1


def num_mosse(N):
    """Ritorna in minimo numero di mosse necessario per spostare una torre di N dischi."""   
    assert N >= 0
    if N==0:
        return 0
    return 2*num_mosse(N-1) +1

def sposta_disco(N, piolo_from, piolo_to):
    print(f"sposta il disco {N} dal piolo {piolo_from} al piolo {piolo_to}")

def sposta_torre(N, piolo_from, piolo_to, piolo_aux):
    """Sposta una torre di Hanoi di <N> dischi
     dal piolo <piolo_form> al piolo <piolo_to>,
     utilizzando <piolo_aux> come spazio di disgaggio,
     e impiegando il minor numero possibile di mosse."""   
    assert N >= 0
    if N==0:
        return
    sposta_torre(N-1,piolo_from, piolo_aux, piolo_to)
    sposta_disco(N, piolo_from, piolo_to)
    sposta_torre(N-1,piolo_aux, piolo_to, piolo_from)

N = int(input())
assert num_mosse(N) == num_mosse_chiusa(N)
print(f"OK {N}")
#print(f"il numero di mosse che serve per spostare una torre di {N} dischi è {num_mosse(N)} mosse.")
#print("Eccole:")
#sposta_torre(N,'A','C','B')