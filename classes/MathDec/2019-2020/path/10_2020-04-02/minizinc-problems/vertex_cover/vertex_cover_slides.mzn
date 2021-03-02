% Vertex cover
% MathDecisions 2020
% Department of Computer Science, University of Verona, Italy
% Matteo Zavatteri, March 2020

% PROBLEM DEFINITION: 
% INPUT: An (undirected) graph G=(V,E) and a positive integer K
% OUTPUT: yes iff there exists V1 subset of V such that:
%         1) |V1| <= K
%         2) for each (u,v) in E, u or v is in V1 (might also be both) 
%

% Graph G
set of int: V;
array[V] of set of int: E;
int: K;


var set of V: V1;
constraint(V1 subset V);

% Condition 1: |V1|<=K
constraint(card(V1) <= K);

% Condition 2: for each (u,v) in E, u or v is in V1 (might also be both) 

constraint(
  forall(u in V, v in E[u])(u in V1 \/ v in V1) 
);

% Alternative check for Condition 2
% constraint(
%   forall(u in V, v in E[u])(card({u,v} intersect V1) != 0) 
% );


% Debug:
%output["V=", show(V), "\n"];
%output["E=", show(E), "\n"];

solve satisfy;

output["V1=", show(V1)];


