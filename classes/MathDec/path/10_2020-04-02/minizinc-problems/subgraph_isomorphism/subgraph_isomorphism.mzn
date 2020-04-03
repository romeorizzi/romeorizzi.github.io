% Subgraph isomorphism
% MathDecisions 2020
% Department of Computer Science, University of Verona, Italy
% Matteo Zavatteri, March 2020

% PROBLEM DEFINITION: 
% INPUT: Two (undirected) graphs G=(VG,EG) and H=(VH,EH)
% OUTPUT: yes iff there exists a graph I=(VI,EI) and an injection f:VH -> VI such that:
%         1) I is a subgraph of G: i.e., VI is a subset of VG and EI is a subset of EG
%         2) |VI|=|VH| and |EI|=|EH|   (i.e., "I is as big as H")
%         3) (u,v) in EH iff (f(v),f(u)) in EI
%
% This is a hardcoded example

% Graph G
set of int: VG = {1,2,3,4,5};
array[1..5] of set of int: EG=[{2,3,4},{1,3,4,5},{1,2,4},{1,2,3,5},{2,4}];

% Graph H
set of int: VH = {1,2,3,4};
array[VH] of set of int: EH=[{2,3,4},{1,4},{1,4},{2,3}];

% Graph I
var set of VG: VI;
array[VG] of var set of VG: EI;

% Condition 1: I is a subgraph of G
constraint(VI subset VG);
constraint(forall(i in VG diff VI)(card(EI[i])=0)); % these actually don't exist in EI (as these indexes are not in VI)
constraint(forall(i in VG)(EI[i] subset EG[i]));

% Condition 2: |VI|=|VH| and |EI|=|EH|
constraint(card(VI)=card(VH));
constraint(sum(i in VI)(card(EI[i])) = sum(i in VH)(card(EH[i])));

% Condition 3: (u,v) in EH iff (f(v),f(u)) in EI
array[VH] of var int: f;

constraint(
  forall(i in VH)(f[i] in VI) % image of f is VI
);

constraint(
  forall(u,v in VH)((u != v) -> (f[v] != f[u])) % f is an injection (one-to-one function)
);

constraint(
  forall(u,v in VH)((v in EH[u]) <-> (f[v] in EI[f[u]])) % (u,v) in EH iff (f(v),f(u)) in EI
);

% Debug:
% output["VG=", show(VG), "\n"];
% output["EG=", show(EG), "\n"];

% output["VH=", show(VH), "\n"];
% output["EH=", show(EH), "\n"];

% output["VI=", show(VI), "\n"];
% output["EI=", show(EI), "\n"];

solve satisfy;
output["f=", show(f)];






  


