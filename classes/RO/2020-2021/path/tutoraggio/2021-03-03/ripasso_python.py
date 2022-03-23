#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb 26 20:09:48 2021

@author: aurora
"""

#STAMPARE RIGA
print("Hello world!")

#VARIABILE STRINGA
name="John"                         #Le stringhe si scrivono tra virgolette
age="35"
print("There once was a man called " + name + ",")
print("he was "+age+" years old.")
print("He really like is name: " + name + ",")
print("but he did't like being "+age+".")

#OPZIONI DI STAMPA
print("hello \nworld")              #andare a capo
print("hello \" world")             #stampare virgolette

#ESEMPI DI FUNZIONE
phrase="Hello"
print(phrase.lower())               #stampa tutto in minuscolo
print(phrase.upper())               #stampa tutto in maiscuolo
print(phrase.isupper())             #mi dice se è tutto maiuscolo
print(phrase.upper().isupper())     #concatenazione funzioni
print(len((phrase)))                #numero lettere stringa
print(phrase[0])                    #stampa prima lettera (INDICI IN PYTHON PARTONO DA 0)
print(phrase.index("o"))            #restuisce indice lettera o    

#NUMERI
print(3)
print(-4.5566)
print(3+54.67)
print(10%3)                         #10 modulo 3
num=5
print(num)
print(str(num))                     #converte numero in stringa
neg_num=-5
print(abs(neg_num))
print(pow(4,2))
print(max(3,3,3,4))
print(min(5,6))
print(round(3.3))


from math import * #IMPORTO FUNZIONI MATEMATICHE da libreria math
print(floor(3.6))
print(ceil(3.2))
print(sqrt(46))

#INPUT
name=input("Enter your name: ")
age=input("Enter your age: ")
print("Hello "+name+"!"+" You are "+age+".")

#LISTE collezioni di variabili: stringhe, numeri ...
friends=["Giulia","Giada","Matilde"] 
print(friends)
print(friends[0])                   #stampiamo gli elementi della lista
print(friends[1])
print(friends[2])
print(friends[-1])                  #ultimo elemento
print(friends[1:])                  #da posizione 1 in poi
#FUNZIONI LISTE
numbers=[1,2,3]
friends.extend(numbers)             #aggiunge alla lista friends numbers
print(friends)
numbers.append(5)                   #aggiunge un elemento
print(numbers)
numbers.insert(2,7)                 #posizione 2 aggiungiamo valore 7
print(numbers)
numbers.remove(5)                   #toglie il 5
print(numbers)
numbers.clear()                     #pulisce la lista
print(numbers)
friends.pop()                       #toglie ultimo elemento
print(friends)
#altre funzioni
#.count per contare robe uguali
#.index mi dice indice
#.sort mi riordina
#.copy copia lista

#TUPLE
#non puoi cambiare assegnamenti, simili alle liste ma si possono sono leggere
t1 = (1,2,3)
print ("t1 =" + str(t1))
#si può fare una lista di tuples

#FUNZIONI
def say_hi():                      #funzione senza input
    print("Hello world")

say_hi()

def cube(num):                     #funzione con input  
    return num*num*num

print(cube(3)) 

#IF
male=True
tall=False
if male or tall:
    print("you are a man or tall or both")
else:
    print("you are not a man nor tall")

if male and tall:
    print("you are a man and tall ")
elif male and not(tall):
    print("you are a short man")
else:
    print("you are not a man not tall not both")

#CICLO FOR
vettore=[2,3,56,7,7]
for i in vettore:
    print(i)

for i in range(30): 
    print(i)
print()
for i in range(20,30):
    print(i)

#CICLO WHILE
i=0
while i<=30:
    print(i)
    i=i+1
    
#MATRICI
# a è una matrice 2-D 
a = [['Roy',80,75,85,90,95],
     ['John',75,80,75,85,100],
     ['Dave',80,80,80,90,95]]
print ("type(a) = " + str(type(a)))
#matrice inizializzata
num_colonne=2
num_righe=4
m = [[0 for y in range(num_colonne)] for x in range(num_righe)]
print (str(m))







