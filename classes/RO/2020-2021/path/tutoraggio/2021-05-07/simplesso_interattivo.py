#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sun May 3 17:34:36 2020

@author: Alice Raffaele
"""

from __future__ import division
from fractions import Fraction
from numpy import *

class Tableau:

    def __init__(self, n, m, obj, prob_type, term_noto_obj = 0):
        self.n = n
        self.m = m
        self.rows = []
        self.cons = []
        self.basis = []
        self.prob_type = prob_type
        if self.prob_type == 'max':
            self.obj = [Fraction(1)] + [Fraction(x) for x in obj]
            self.term_noto_obj = Fraction(term_noto_obj)
        elif self.prob_type == 'min':
            self.obj = [Fraction(1)] + [-Fraction(x) for x in obj]
            self.term_noto_obj = Fraction(-term_noto_obj)

    def aggiungi_vincolo(self, expression, value):
        self.rows.append([Fraction(0)] + [Fraction(x) for x in expression])
        self.cons.append(Fraction(value))


    def is_optimal(self):
        if max(self.obj[1:-1]) <= 0:
            #print('La soluzione di base associata è ottima.')
            return True
        #print('La soluzione di base associata NON è ottima.')
        return False

    def is_feasible(self):
        rhs = [self.rows[i][-1] for i in range(len(self.rows))]
        if min(rhs) < 0:
            #print('La soluzione di base associata NON è ammissibile per il primale.')
            return False
        #print('La soluzione di base associata è ammissibile per il primale.')
        return True

    def _colonna_di_max_guadagno(self):
    # restituisce una colonna di pivot utile ad incrementare la funzione obiettivo (come nel simplesso primale)
        low = 0
        idx = 0
        for i in range(1, len(self.obj)-1):
            if self.obj[i] > low:
                low = self.obj[i]
                idx = i
        if idx == 0: return -1
        return idx

    def _riga_max_inammissibile(self):
    # restituisce una riga di pivot utile a ridurre l'inammissibilità (come nel simplesso duale)
        rhs = [self.rows[i][-1] for i in range(len(self.rows))]
        low = 0
        idx = -1
        for i in range(len(rhs)):
            if rhs[i] < low:
                low = rhs[i]
                idx = i
        return idx

    def _riga_bloccante(self, col):
    # restituisce una riga di pivot per una data colonna di pivot (come nel simplesso primale)
        rhs = [self.rows[i][-1] for i in range(len(self.rows))]
        lhs = [self.rows[i][col] for i in range(len(self.rows))]
        ratio = []
        for i in range(len(rhs)):
            if lhs[i] <= 0:
                ratio.append(Fraction(99999999 * abs(max(rhs))))
                continue
            ratio.append(Fraction(rhs[i],lhs[i]))
        return argmin(ratio)

    def _colonna_bloccante(self, riga):
    # restituisce una colonna di pivot per una data riga di pivot (come nel simplesso duale)
        rhs = [self.rows[i][-1] for i in range(len(self.rows))]
        ratio = []
        for j in range(0, len(self.obj)-1):
            if self.rows[riga][j] >= 0:
                ratio.append(Fraction(-99999999 * abs(max(rhs))))
                continue
            ratio.append(Fraction(self.obj[j], self.rows[riga][j]))
        if max(ratio) < 0:
            return -1
        return argmax(ratio)

    def mostra_tableau(self):
        s = 'xB'
        # Header
        for i in range(len(self.rows[0])-2):
            s += '\tx' + str(int(i+1))
        s += '\tb'
        # Parte interna Tableau
        for i in range(len(self.rows)):
            s += '\nx'+str(int(self.basis[i]))
            for j in range(1,len(self.rows[i])):
                s += '\t' + str(self.rows[i][j])
        # Coefficienti di costo ridotto e funzione obiettivo
        s += '\nc.c.r.'
        for i in range(1,len(self.obj)-1):
            s += '\t' + str(self.obj[i])
        if self.prob_type == 'max':
            s += '\t' + str(self.obj[-1]-self.term_noto_obj)
        elif self.prob_type == 'min':
            s += '\t' + str(self.obj[-1]+self.term_noto_obj)
        print(s)
        self.stampa_soluzione_base_corrente()

    def crea_primo_tableau(self):
        # Compilo il tableau
        for i in range(len(self.rows)):
            self.obj += [0]
            ident = [0 for r in range(len(self.rows))]
            ident[i] = Fraction(1)
            self.rows[i] += ident + [self.cons[i]]
            self.rows[i] = array(self.rows[i])
        self.obj = array(self.obj + [0])

        # Setto le slack come variabili di base
        if self.n >= self.m:
            for i in range(1,self.m+1):
                self.basis += [self.n+i]
        else: # self.n < self.m:
            for i in range(0,self.m):
                self.basis += [self.n+i+1]
            #print(self.basis)

    def _pivot(self, row, col):
        #print('row = ' + str(row))
        #print('col = ' + str(col))
        e = self.rows[row][col]
        print('Elemento pivot a[' + str(row+1) + '][' + str(col) + '] = ' + str(e))
        assert e != 0
        self.rows[row] /= e
        for r in range(len(self.rows)):
            if r == row: continue
            self.rows[r] = self.rows[r] - self.rows[r][col]*self.rows[row]
        #print('prima: ' + str(self.obj))
        self.obj = self.obj - self.obj[col]*self.rows[row]
        #print('dopo: ' + str(self.obj))

    def pivot_colonna_riga(self, c, r):
        self._pivot(r-1,c)
        print('Variabile entrante: x' + str(c))
        print('Variabile uscente: x' + str(self.basis[r-1]))
        self.basis[r-1] = c

    def step_primale(self):
        c = self._colonna_di_max_guadagno()
        r = self._riga_bloccante(c)
        self._pivot(r,c)
        print('Variabile entrante: x' + str(c))
        print('Variabile uscente: x' + str(self.basis[r]))
        self.basis[r] = c

    def step_duale(self):
        print('Iterazione con il simplesso duale')
        r = self._riga_max_inammissibile()
        if r == -1:
            print('Attenzione: nessun termine noto è negativo -> Puoi continuare con il simplesso primale')
            return
        c = self._colonna_bloccante(r)
        if c == -1:
            print('Il duale è illimitato -> Il primale è impossibile -> Fine')
            return
        self._pivot(r,c)
        print('Variabile entrante: x' + str(c))
        print('Variabile uscente: x' + str(self.basis[r]))
        self.basis[r] = c

    def stampa_soluzione_base_corrente(self):
        sol = [0 for x in range(len(self.rows[0])-2)]
        for i in range(len(self.basis)):
            sol[self.basis[i]-1] = self.rows[i][-1]
        s = 'Soluzione di base = ('
        for i in range(len(sol)):
            if i != len(sol)-1:
                s += str(sol[i]) + ', '
            else:
                s += str(sol[i]) + ')'
        print(s)
        if self.prob_type == 'max':
            print('Funzione obiettivo = ' + str(-(self.obj[-1])+self.term_noto_obj))
        elif self.prob_type == 'min':
            print('Funzione obiettivo = ' + str((self.obj[-1])+self.term_noto_obj))


    def prossimo_step(self):
        self.stampa_soluzione_base_corrente()
        if self.is_feasible():
            if self.is_optimal():
                print("Tale soluzione è ammissibile e ottima -> Fine")
            else:
                print("Tale soluzione è ammissibile ma NON è ottima -> Continua con il simplesso primale")
        else:
            if self.is_optimal():
                print("Tale soluzione NON è ammissibile ma soddisfa le condizioni di ottimalità -> Continua con il simplesso duale")
            else:
                print("Tale soluzione NON è né ammissibile né ottima")
