#!/usr/bin/env python3
# a fast prototyped (python and no ROM/instance API) solution to the problem triangle, with the following characteristic:
# it actually constructs an optimal solution path using only O(n) truly internal RAM memory (assuming the instance triangle t is stored on external ROM memory).
# it expoloits the general of Hirschberg, to make both a memory-efficient and a time-efficient recursion.
# which is more general than what explicitely said in Hirschberg'paper (first link).
#  http://www.mathcs.emory.edu/~cheung/Courses/323/Syllabus/DynProg/Docs/Hirschberg=Linear-space-LCS.pdf
#  https://en.wikipedia.org/wiki/Hirschberg%27s_algorithm
# hope the design of the actual coding might illustrate the power of the inductive approach. Also somewhat of sentinels, print debugging, expressions written as to make the computer do the work/checking, asserts, and pervasive use of semi-open interval (also at the level of the recursive contract for the main procedure yield_an_optimal_path_from_point_to_point).
# Romeo Rizzi, 2020-04-20, my birthday.

def gimme_rowmaxvalues_from_point_to_row(rowp,colp,row,leftmost_col,rightmost_col):
    # paths that start from the point (rowp,colp) and reach down to row row, never getting to the right of rightmost_col
    assert row >= rowp
    assert rightmost_col >= colp
    #print(f"gimme_rowmaxvalues_from_point_to_row(rowp={rowp},colp={colp},row={row},leftmost_col={leftmost_col},rightmost_col={rightmost_col})")
    row_vals = [t[rowp][colp]]
    #print(row_vals)
    for r in range(rowp+1,row+1):
        if len(row_vals) <= rightmost_col-colp: 
            row_vals.append(row_vals[-1]) # allot the space and initialize it with just a kind of "sentinel value"
        for c in reversed(range(1,len(row_vals))):
            row_vals[c] = t[r][colp+c] + max(row_vals[c],row_vals[c-1])
        row_vals[0] += t[r][colp]
        #print(row_vals)
    #print(f" -->got row_vals[leftmost_col-colp:]= {row_vals[leftmost_col-colp:]}")
    return row_vals[leftmost_col-colp:]

def gimme_rowmaxvalues_to_point_from_row(rowp,colp,row,leftmost_col,rightmost_col):
    # paths that start from the point (rowp,colp) and reach up to row row, never getting to the left of leftmost_col
    assert row <= rowp
    assert leftmost_col <= colp
    #print(f"gimme_rowmaxvalues_to_point_from_row(rowp={rowp},colp={colp},row={row},leftmost_col={leftmost_col},rightmost_col={rightmost_col})")
    row_vals = [t[rowp][colp]]
    first_col = colp
    #print(row_vals)
    for r in reversed(range(row,rowp)):
        if first_col > leftmost_col:
            first_col -= 1
            #print(f"r = {r}, first_col= {first_col}, row_vals[0]+t[r][first_col]= {row_vals[0]+t[r][first_col]}")
            row_vals.insert(0,t[r][first_col] + row_vals[0])
            #print(row_vals)
        else:
            if first_col < colp:
                row_vals[0] = t[r][first_col] + max(row_vals[0],row_vals[1])
            else:
                row_vals[0] = t[r][first_col] + row_vals[0]
        for c in range(first_col+1,min(r,colp)+1):
            if c < colp:
                row_vals[c-first_col] = t[r][c] + max(row_vals[c-first_col],row_vals[c-first_col+1])
            else:
                row_vals[c-first_col] = t[r][c] + row_vals[c-first_col]
        #print(row_vals)
    #print(f" -->got row_vals[:rightmost_col-leftmost_col+1]= {row_vals[:rightmost_col-leftmost_col+1]}")
    return row_vals[:rightmost_col-leftmost_col+1] # resize to drop the row values left falling outside the triangle to the right

def yield_an_optimal_path_from_point_to_point(row1,col1,row2,col2):
    # except for the very first starting cell that is omitted, this procedures prints, in their order,
    # each one of the cells of the triangle as visited into a maximum weight path
    # that moves from the cell (row1,col1) all the way down to the cell (row2,col2)  
    assert [0]*2 <= [row1,row2] < [N]*2
    assert row2 >= row1
    assert col2 >= col1
    assert col2-col1 <= row2-row1
    #print(f"yield_an_optimal_path_from_point_to_point(row1={row1},col1={col1},row2={row2},col2={col2}")
    #print_t()
    if col2==col1:
        for r in range(row1+1,row2+1):
            visit_point(r,col1)
    elif row2-row1==1:
        visit_point(row2,col2)
    else:
        rowM = (row1+row2)//2  # divide et impera for minimizing the time resource consumption
        leftM = max(col1,col2-(row2-rowM))
        rightM = min(rowM,col2,col1+(rowM-row1))
        #print(f"rowM= {rowM}, middle_row= {t[rowM]}, leftM= {leftM}, rightM= {rightM}")
        reddish_row_values = gimme_rowmaxvalues_from_point_to_row(row1,col1,rowM,leftM,rightM)
        greensh_row_values = gimme_rowmaxvalues_to_point_from_row(row2,col2,rowM,leftM,rightM)
        #print(f"reddish_row_values= {reddish_row_values}, greensh_row_values= {greensh_row_values}")
        assert(len(greensh_row_values) == rightM-leftM+1)
        assert(len(reddish_row_values) == rightM-leftM+1)
        gold_row_values = [red +green -tval_taken_twice for red,green,tval_taken_twice in zip(reddish_row_values, greensh_row_values, t[rowM][leftM:rightM+1])]
        a_good_col_in_middle_row = max((x,i+leftM) for i,x in enumerate(gold_row_values))[1]
        #print(f"gold_row_values= {gold_row_values}, a_good_col_in_middle_row= {a_good_col_in_middle_row}")
        yield_an_optimal_path_from_point_to_point(row1,col1,rowM,a_good_col_in_middle_row)
        yield_an_optimal_path_from_point_to_point(rowM,a_good_col_in_middle_row,row2,col2)
    
# THE MAIN:

N = int(input())
t = []
for _ in range(N):
    t.append(list(map(int, input().split())))
assert len(t) == N

def print_t():
    for r in t:
        print(r)

last_row_values = gimme_rowmaxvalues_from_point_to_row(0,0,N-1,0,N-1)
a_good_col_in_last_row = max((x,i) for i,x in enumerate(last_row_values))[1]
#print(f"a_good_col_in_last_row= {a_good_col_in_last_row}, last_row_values= {last_row_values}")
opt_val = last_row_values[a_good_col_in_last_row]
collected_val = 0
def visit_point(row,col):
    global collected_val
    collected_val += t[row][col]
    print(f"visiting cell ({row},{col}) of value {t[row][col]}, collected value up to here: {collected_val}")
visit_point(0,0)
yield_an_optimal_path_from_point_to_point(0,0,N-1,a_good_col_in_last_row)
print(f"opt_val= {opt_val}, collected_val= {collected_val}"); assert(opt_val==collected_val)
