#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Dec  7 17:04:19 2017

@author: Alice Raffaele
"""

import math
import random
from gurobipy import *

# -------------------------------------------------------------------
# USEFUL FUNCTIONS

# Callback: use lazy constraints to eliminate subtours
def subtourelim(model, where):
    if where == GRB.callback.MIPSOL:
        print '\nNew solution found: checking the presence of subtours...'
        selected = []
        # Make a list of edges selected in the solution
        vals = model.cbGetSolution(model._vars)
        selected = tuplelist((i,j) for i,j in model._vars.keys()
                                if vals[i,j] > 0.5)
        
        # Find the shortest cycle in the selected edge list
        tour = subtour(selected)
        if len(tour) < n:
            # Add a subtour elimination constraint
            print 'One subtour found: ' + str(tour)
            expr = 0
            for i in range(len(tour)):
                for j in range(i+1, len(tour)):
                    expr += model._vars[tour[i], tour[j]]
            print 'Subtour Elimination Constraint added:'
            print str(expr) + ' <= ' + str(len(tour)-1)
            model.cbLazy(expr <= len(tour)-1)
        else:
            print 'No subtour found!'

# Given a list of edges, this method finds the shortest subtour
def subtour(edges):
    visited = [False]*n
    cycles = []
    lengths = []
    selected = [[] for i in vertices]
    for x,y in edges:
        selected[x].append(y)
        selected[y].append(x) # Edges in both directions 
    while True:
        current = visited.index(False)
        thiscycle = [current]
        while True:
            visited[current] = True
            neighbors = [x for x in selected[current] if not visited[x]]
            if len(neighbors) == 0:
                break
            current = neighbors[0]
            thiscycle.append(current)
        cycles.append(thiscycle)
        lengths.append(len(thiscycle))
        if sum(lengths) == n:
            break
    return cycles[lengths.index(min(lengths))]

# -------------------------------------------------------------------
# MODEL DEFINITION
    
# Create vertices and edges for our example
vertices = [0,1,2,3,4,5] #vertices = ['A', 'B', 'C', 'D', 'E', 'F']
# We do not use letters just to avoid issues with indexing and syntax errors
edges = {
    (0,1): 5,
    (0,2): 5,
    (0,3): 4,
    (1,4): 2, #9
    (1,5): 3,
    (2,3): 3,
    (2,5): 8,
    (3,4): 4,
    (4,5): 4}

n = len(vertices)

# Create the model
m = Model()

# Create the variables
vars = {}
for i,j in edges.keys():
   vars[i,j] = m.addVar(obj=edges[i,j], vtype=GRB.BINARY,
                        name='e[%d,%d]'%(i,j))
for i,j in vars.keys():
    vars[j,i] = vars[i,j] # Edges in both directions

# To create the model data structure only once, after variables creation
m.update()

# Add the objective function
m.setObjective(sum(vars[i,j]*edges[i,j]
                for (i,j) in edges.keys()),GRB.MINIMIZE)

# Add degree-2 constraint
for i in vertices:
    m.addConstr(sum(vars[i,j] for j in vertices
                if (i,j) in edges.keys() or (j,i) in edges.keys()) == 2)
    

def printSolution():
    print '\n--------------------------------------------------------------\n'
    solution = m.getAttr('x', vars)
    selected = [(i,j) for i,j in edges.keys() if solution[i,j] > 0]
    print 'Edges in solution: ' + str(selected)
    print('Optimal tour: %s' % str(subtour(selected)))
    print('Optimal cost: %g' % m.objVal)


# -------------------------------------------------------------------
# MODEL OPTIMIZATION

# Without SECs
print '\n--------------------------------------------------------------\n'
print 'Optimize model without SECs\n'
m._vars = vars
m.optimize()
# Print optimal solution
printSolution()

# With Lazy Constraints
print '\n--------------------------------------------------------------\n'
print 'Adding Lazy Constraints\n'
m.reset()
m.params.LazyConstraints = 1
m.optimize(subtourelim)
# Print optimal solution
printSolution()
