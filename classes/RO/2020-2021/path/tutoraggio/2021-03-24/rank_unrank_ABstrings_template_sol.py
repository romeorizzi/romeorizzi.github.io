# -*- coding: utf-8 -*-
# Template di soluzione per il problema rank_unrank_ABstrings


# INIZIO area entro la quale ti richiediamo/consigliamo di operare.

def ABstring2rank(s):
    a=0
    b=2**len(s)
    for i in range(0,len(s)):
        if s[i]=="A":
            b=b-((b-a)/2)
        else:
            a=a+((b-a)/2)
    return a

def ABstring_of_len_and_rank(length, r):
    s=""
    a=0
    b=2**len(s)
    for i in range(0,length):
        val=(b-a)/2
        if a<=r and r<b-val:
            s+="A"
            b=b-val
        if a+val<=r and r<b:
            s+="B"
            a=a+val
    return s        

# FINE area entro la quale ti richiediamo/consigliamo di operare.


##Gestione input
input_string = input("Inserisci input: ")

if input_string[0] == 'A' or input_string[0] == 'B':
   print( ABstring2rank(input_string) )
else:
   length, r = input_string.split()
   print( ABstring_of_len_and_rank(int(length), int(r)) )

