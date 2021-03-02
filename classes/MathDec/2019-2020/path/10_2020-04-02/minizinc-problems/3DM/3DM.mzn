% 3DM
% MathDecisions 2020
% Department of Computer Science, University of Verona, Italy
% Matteo Zavatteri, March 2020

% PROBLEM DEFINITION: 
% INPUT: 3 disjoint sets X,Y,Z each of size n and a set T subset of the cross product of X,Y,Z.
% OUTPUT: yes iff there exists T1 subset of T such that:
%         1) |T1|=n
%         2) each i in (X union Y union Z) is contained exacly in one of the triples of T1.
%


int: N = 3;

set of int: X = 11..13;
set of int: Y = 21..23;
set of int: Z = 31..33;

constraint(X intersect Y = {});
constraint(X intersect Z = {});
constraint(Y intersect Z = {});

constraint(assert(card(X)=N,"X: wrong cardinality"));
constraint(assert(card(Y)=N,"Y: wrong cardinality"));
constraint(assert(card(Z)=N,"Z: wrong cardinality"));

array[1..5] of var set of int: T = [{11,21,33}, {12,21,31}, {12,23,32}, {13,21,33}, {13,22,31}];

var set of 1..5: T1; % indexes of sets in T

% Condition 1
constraint(card(T1)=N);

% Constraint 2
constraint(
  forall(x in (X union Y union Z))(
    exists(t1 in T1)(
      x in T[t1] /\ forall(t2 in T1 where t2 != t1)(not(x in T[t2]))
    )
  )
);

solve satisfy;

output["T1=", show(T1)];