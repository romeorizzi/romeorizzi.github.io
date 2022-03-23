% Use this editor as a MiniZinc scratch book

enum Jobs;
array[Jobs] of int: cost;

int: Budget;

var set of Jobs: Selected;

constraint sum(job in Selected)(cost[job]) = Budget;

solve satisfy;