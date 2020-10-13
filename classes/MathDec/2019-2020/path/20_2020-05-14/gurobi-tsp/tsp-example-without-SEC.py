#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Wed Dec 13 11:53:56 2017

@author: alice
"""

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
m.setObjective(sum(vars[i,j]*edges[i,j] for (i,j) in edges.keys()),
               GRB.MINIMIZE)

# Add degree-2 constraint
for i in vertices:
    m.addConstr(sum(vars[i,j] for j in vertices
                if (i,j) in edges.keys() or (j,i) in edges.keys()) == 2)

def printSolution():
    print '\n--------------------------------------------------------------\n'
    solution = m.getAttr('x', vars)
    selected = [(i,j) for i,j in edges.keys() if solution[i,j] > 0]
    print 'Edges in solution: ' + str(selected)
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