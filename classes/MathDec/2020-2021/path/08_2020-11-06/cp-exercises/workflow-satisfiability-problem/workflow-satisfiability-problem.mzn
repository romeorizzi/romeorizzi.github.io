% Use this editor as a MiniZinc scratch book

enum TASKS;
enum USERS;

array[TASKS] of var set of USERS: AUTHORIZED;

int: nPO;
array[1..nPO,1..2] of TASKS: PO;

array[TASKS] of var USERS: user;
array[TASKS] of var 1..max(TASKS): order;

int: nEq;
int: nDiff;

array[1..nEq,1..2] of TASKS: EqC;
array[1..nDiff,1..2] of TASKS: DiffC;

constraint forall(t in TASKS)(user[t] in AUTHORIZED[t]);
constraint forall(i in 1..nPO)(order[PO[i,1]] < order[PO[i,2]]);

constraint forall(i in 1..nEq)(user[EqC[i,1]] = user[EqC[i,2]]);
constraint forall(i in 1..nDiff)(user[DiffC[i,1]] != user[DiffC[i,2]]);

solve satisfy;

output["User assignment:  "];
output[show(t) ++ "=" ++ show(user[t]) ++ ", " | t in TASKS];
output["\nOrdering:         "];
output[show(t) ++ "=" ++ show(order[t]) ++ ", " | t in TASKS];