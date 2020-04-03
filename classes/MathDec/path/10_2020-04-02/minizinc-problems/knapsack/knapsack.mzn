% Knapsack
% MathDecisions 2020
% Department of Computer Science, University of Verona, Italy
% Matteo Zavatteri, March 2020

% PROBLEM DEFINITION: 
% INPUT: A finite set I of items where for each i in I, w(i) is the weight and v(i) is the value of item i (with w(i) and v(i) positive integers), and two positive integers W and V.
% OUTPUT: yes iff there exists I1 subset of I such that sum_{i in I1}w(i) <= W and sum_{i in I1} v(i) >= V.
%

int: N; % number of items
set of int: I = 1..N;

array[I] of int: w;
array[I] of int: v;

int: W;
int: V;

var set of I: I1;
constraint sum(i in I1)(w[i]) <= W;
constraint sum(i in I1)(v[i]) >= V;

solve satisfy;

output["I1=", show(I1)];