set EDGES; # Insieme delle etichette per gli archi

param H1{EDGES} binary >= 0;
param H2{EDGES} binary >= 0;
param H3{EDGES} binary >= 0;
param W{EDGES} >= 0;

var c{EDGES} binary; # cofficints of the unknown separating inequality cx <= b
var b >= 0; # constant term of the unknown separating inequality cx <= b
var sep >= 0;

minimize val_of_b:
         b;

minimize cval:
         sum{i in EDGES} c[i];

maximize val_of_sep:
         sep;

minimize val_size_of_c:
         sum{i in EDGES} c[i];

# vincoli degli  H  che devono rispettare la disguaglianza:
subject to H1ok: 
        sum{i in EDGES} H1[i] * c[i] <= b;
subject to H2ok: 
        sum{i in EDGES} H2[i] * c[i] <= b;
subject to H3ok: 
        sum{i in EDGES} H3[i] * c[i] <= b;

# vincolo che W tagliato fuori dal politopo:
subject to Wout: 
        sum{i in EDGES} W[i] * c[i] >= b+1;

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

#objective val_of_b;
#objective val_of_sep;

objective val_size_of_c;


solve;

# Stampa della soluzione che minimizza val_size_of_c:
printf "*************************************\n\nHo computato una soluzione che minimizzi val_size_of_c.\nEccone una descrizione:\n";

display c;

printf "b = ";
display val_of_b;

printf "sep = ";
display val_of_sep;

printf "val_size_of_c = ";
display val_size_of_c;


