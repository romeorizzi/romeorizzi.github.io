% Subset sum
% MathDecisions 2020
% Department of Computer Science, University of Verona, Italy
% Matteo Zavatteri, March 2020

% PROBLEM DEFINITION: 
% INPUT: A finite set X of elements where for each x in X s(x) is an integer, and an integer S.
% OUTPUT: yes iff there exists X1 subset of X such that sum_{x in X1}(s(x)) = S.
%

int: N; % number of elements of X

set of int: X = 1..N;

array[X] of int: s; 

int: S;

var set of X: X1;

constraint(
  sum(i in X1)(s[i]) = S
);

solve satisfy;

output["X1=", show(X1)];