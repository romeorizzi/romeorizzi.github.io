#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def F(n):
    """Ritorna il numero di modi di piastrellare
    un bagno 2xn ben squadrato"""
    assert n >= 0
    if n == 0:
        return 1
    if n == 1:
        return 2
    return F(n-1) + G(n-1) + H(n-2)

def G(n):
    """Ritorna il numero di modi di piastrellare
    un bagno 2x(n+1) che ha perso una cella d'angolo.
    ben squadrato. Nota: la riga corta ha n celle."""
    assert n >= 0
    if n == 0:
        return 1
    return F(n) + G(n-1)

def H(n):
    """Ritorna il numero di modi di piastrellare
    un bagno 2x(n+2) che ha perso due celle di cui precisamente una d'angolo e poi una sua limitrofa. Nota: la riga corta ha n celle."""
    assert n >= 0
    return G(n) + F(n)

############

def stampaPiastrellatureF(n):
    """Stampa tutte le piastrellature del bagno 2xN compatibili con quanto si trova nella variabile globale piastrellatura.
       Resta da scegliere come piastrellare quel sottobagno di celle (i,j)
       con  piastrellatura[i][j] = 0.
       Esso è un bagno 2xn ben squadrato collocato a destra entro il bagno 2xN."""
    assert n >= 0
    if n == 0:
        printPiastrellatura()
        return
    min_free = 1
    assert piastrellatura[0][N-n-1] != 0
    if min_free == piastrellatura[0][N-n-1]:
        min_free += 1
    if min_free == piastrellatura[1][N-n-1]:
        min_free += 1
    if min_free == piastrellatura[0][N-n-1]:
        min_free += 1
    free2 = min_free + 1
    if free2 == piastrellatura[0][N-n-1]:
        free2 += 1
    if free2 == piastrellatura[1][N-n-1]:
        free2 += 1
    if free2 == piastrellatura[0][N-n-1]:
        free2 += 1
    if n == 1:
        piastrellatura[0][N-1] = piastrellatura[1][N-1] = min_free 
        printPiastrellatura()
        piastrellatura[0][N-1] = min_free
        piastrellatura[1][N-1] = free2
        printPiastrellatura()
        return
    piastrellatura[0][N-1] = piastrellatura[1][N-1] = min_free 
    stampaPiastrellatureF(n-1)
    piastrellatura[0][N-1] = piastrellatura[1][N-1] = 0 
    piastrellatura[0][N-1] = min_free 
    stampaPiastrellatureG(n-1)
    piastrellatura[0][N-1] = 0 
    stampaPiastrellatureH(n-2)
    piastrellatura[0][N-1] = piastrellatura[0][N-2] = min_free 

def stampaPiastrellatureG(n):
    """Stampa tutte le piastrellature del bagno 2xN compatibili con quanto si trova nella variabile globale piastrellatura.
       Resta da scegliere come piastrellare quel sottobagno di celle (i,j)
       con  piastrellatura[i][j] = 0.
       Esso è un bagno 2x(n+1) che ha perso una cella d'angolo.
       Nota: la riga corta ha n celle."""
    assert n >= 0
    if n == 0:
        piastrellatura[i][j] = 0
        return 1

    
    return stampaPiastrellatureF(n) + stampaPiastrellatureG(n-1)

def stampaPiastrellatureH(n):
    """Stampa *tutte* le piastrellature di
    un bagno 2x(n+2) che ha perso due celle di cui precisamente una d'angolo e poi una sua limitrofa. Nota: la riga corta ha n celle."""
    assert n >= 0
    return stampaPiastrellatureG(n) + stampaPiastrellatureF(n)

############

with open("input.txt", "r") as fr:
    N = int(fr.readline())

fw = open("output.txt", "w")

def printPiastrellatura():
    for i in range(N):
        fw.write(str(piastrellatura[0][i]) + " ")
    fw.write("\n")
    for i in range(N):
        fw.write(str(piastrellatura[1][i]) + " ")
    fw.write("\n")

fw.write(str(F(N)))
fw.write("\n")

piastrellatura = [ [0]*N, [0]*N]

#printPiastrellatura()
    
stampaPiastrellatureF(N)
