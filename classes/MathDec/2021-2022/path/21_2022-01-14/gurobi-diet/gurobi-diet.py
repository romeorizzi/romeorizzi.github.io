#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu May 14 15:09:49 2020

@author: Alice Raffaele
"""

from gurobipy import *


# Sets and parameters
nutritionals, minNutrition, maxNutrition = multidict({
    'calories': [2000, GRB.INFINITY],
    'protein': [50, GRB.INFINITY],
    'calcium': [700, GRB.INFINITY]})

foods, cost, maxPortions = multidict({
    'bread': [3, 4],
    'milk': [2, 7],
    'eggs': [3, 2],
    'meat': [19, 3],
    'sweets': [15, 2]})

nutritionalValues = {
    ('bread', 'calories'): 150,
    ('bread', 'protein'): 4,
    ('bread', 'calcium'): 2,
    ('milk', 'calories'): 120,
    ('milk', 'protein'): 8,
    ('milk', 'calcium'): 285,
    ('eggs', 'calories'): 160,
    ('eggs', 'protein'): 15,
    ('eggs', 'calcium'): 54,
    ('meat', 'calories'): 230,
    ('meat', 'protein'): 14,
    ('meat', 'calcium'): 4,
    ('sweets', 'calories'): 450,
    ('sweets', 'protein'): 4,
    ('sweets', 'calcium'): 22}

m = Model('diet')

# Variables
buy = {}
for f in foods:
    buy[f] = m.addVar(0, maxPortions[f], name=f) # m.addVar(lower_bound, upper_bound, var_name)
# Alternatively, you can add the variables one by one:
# buy['bread'] = m.addVar(0, maxPortions['bread'], name='bread')

# Constraints
    # m.addRange(expression, min_value, max_value, constraint-names)

    # calories:
    # Step 1: a specific constraint with explicit parameters
    # m.addRange(150*x['bread'] +  120*x['milk'] + 160*x['eggs'] + 230*x['meat'] + 450*x['sweets'],
    #           minNutrition['calories'], maxNutrition['calories'], 'calories-cons')
    # Step 2: substituting parameters instead of numerical values
    # m.addRange(nutritionValues['bread','calories']*x['bread'] + nutritionValues['milk','calories']*x['milk'] + 160*x['eggs'] + 230*x['meat'] + 450*x['sweets'],
               #minNutrition['calories'], maxNutrition['calories'], 'calories-cons')
    # Step 3: formulating the same expression in a more compact way
    # m.addRange(sum(nutritionalValues[f, 'calories']*x[f] for f in foods), minNutrition['calories'], maxNutrition['calories'], 'calories-cons'))
    # Step 4: formulate the whole family of constraints of the same type

for n in nutritionals:
    m.addRange(sum(nutritionalValues[f,n]*buy[f] for f in foods), minNutrition[n], maxNutrition[n], n+'_cons')

# m.setObjective(expression, min/max)
m.setObjective(sum(buy[f]*cost[f] for f in foods), GRB.MINIMIZE)

m.optimize()

def print_solution():
    if m.status == GRB.Status.OPTIMAL:
        print('\nCost: ' + str(m.objVal))
        print('Amount of portions: ')
        xbuy = m.getAttr('x', buy)
        for f in foods:
            if buy[f].x > 0.0001:
                print(f + '= ' + str(round(xbuy[f], 3)))
    else:
        print('No optimal solution found')

print_solution()

print('\nAdding one more constraint...')

m.addConstr(buy['milk']+buy['eggs']<=6, 'limit_milk_eggs')
m.optimize()
print_solution()
