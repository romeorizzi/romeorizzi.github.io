# -*- coding: utf-8 -*-
# Template di soluzione di game2stacks







# INIZIO area entro la quale ti richiediamo/consigliamo di operare.

def mossa_2stack(n1,n2):
    if n1==n2:
        return(0,0)
    if n1>n2:
        return(n1-n2,0)
    else:
        return(0,n2-n1)
    
# FINE area entro la quale ti richiediamo/consigliamo di operare.


lista=(input("N1 e N2: ").split(' '))
n1=int(lista[0])
n2=int(lista[1])
print(mossa_2stack(n1, n2))



