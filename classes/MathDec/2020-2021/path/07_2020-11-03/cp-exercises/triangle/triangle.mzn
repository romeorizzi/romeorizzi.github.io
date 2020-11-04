int: N;
array[1..N,1..N] of int: TRIANGLE;

array[1..N,1..N] of var 0..1: path;

constraint path[1,1] = 1;

constraint sum(i in 1..N, j in 1..N)(path[i,j]) = N;

constraint forall(i in 1..N-1, j in 1..N-i)(
             if path[i,j] = 1  then (path[i+1,j] + path[i,j+1]) = 1 
                               else true 
              endif
            );

/* solve satisfy; */

solve maximize sum(i in 1..N, j in 1..N)(TRIANGLE[i,j]*path[i,j]);

output[show(path[i,j]) ++ if j mod N == 0 then "\n" else " " endif | i in 1..N,j in 1..N];