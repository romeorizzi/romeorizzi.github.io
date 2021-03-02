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

with open("input.txt", "r") as fr:
    n = int(fr.readline())

with open("output.txt", "w") as fw:
    fw.write(str(F(n)) + "\n")
