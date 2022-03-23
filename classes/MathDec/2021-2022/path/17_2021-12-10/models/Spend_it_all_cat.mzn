% Use this editor as a MiniZinc scratch book

enum Categories;
enum Jobs;
array[Categories] of set of Jobs: JobsToDo;
array[Jobs] of int: cost;
int: Budget;

%constraint assert(forall(c1,c2 in Categories where c1 != c2)(JobsToDo[c1] intersect JobsToDo[c2] = {}), "Invalid data file");

constraint assert(forall(c1,c2 in Categories where c1 != c2)(JobsToDo[c1] intersect JobsToDo[c2] = {}), "Invalid data file");

var set of Jobs: SelectedJobs;

constraint sum(job in SelectedJobs)(cost[job]) = Budget;
constraint forall(c in Categories)(JobsToDo[c] intersect SelectedJobs != {});

%constraint forall(c in Categories)(exists(j in SelectedJobs)(j in JobsToDo[c]));

solve satisfy;