set EDGES; # Insieme delle etichette per gli archi

param H1{EDGES} binary >= 0;
param H2{EDGES} binary >= 0;
param H3{EDGES} binary >= 0;
param W{EDGES} >= 0;

var c{EDGES} binary; # cofficints of the unknown separating inequality cx <= b
var b >= 0; # constant term of the unknown separating inequality cx <= b

minimize cval:
         sum{i in EDGES} c[i];

minimize val_of_b:
         b;

# vincoli degli  H  che dcono rispettare la disguaglianza:
subject to H1ok:
        sum{i in EDGES} H1[i] * c[i] >= b+1;
subject to H2ok:
        sum{i in EDGES} H2[i] * c[i] >= b+1;
subject to H3ok:
        sum{i in EDGES} H3[i] * c[i] >= b+1;

# vincolo che W tagliato fuori dal politopo:
subject to Wout:
        sum{i in EDGES} W[i] * c[i] <= b;

#BEGIN SEZIONE DATA
data;

param: EDGES: H1 H2 H3 W :=
  AB 0 1 1 0
  AD 1 1 0 1
  AE 1 0 1 1
  BC 1 1 0 1
  BF 1 0 1 1
  CD 1 0 1 0
  CF 0 1 1 1
  DE 0 1 1 1
  EF 1 1 0 0
;

option solver lpsolve; # lpsolve gestisce anche i vincoli di interezza.

objective val_of_b;
solve;

# Stampa della soluzione che minimizza b:
printf "*************************************\n\nHo computato una soluzione che minimizzi b.\nEccone una descrizione:\n";

printf "b = ";
display val_of_b;

display c;
