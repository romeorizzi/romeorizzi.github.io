/*\
file: setcovering_ampl_mod.txt   date: 19-November-2017   author: Alice Raffaele (alice.raffaele@unitn.it)
	- WARNING: this file cannot be used by itself but there are other two files to compose a trio:
		- setcovering_ampl_mod.txt
		- setcovering_ampl_dat.txt
		- setcovering_ampl_run.txt
The trio implements an AMPL model created by Alice Raffaele (alice.raffaele@unitn.it) with the following didactical purposes:
	- introducing to mathematical modeling as an operative instrument;
	- modeling our problem referring to classical Operations Research meta-models: Set Covering Problem.
	- in this specific example (this file has some "brother" files basically identical, just related to other
		mathematical modeling languages), we are going to introduce the use of Algebraic Modeling Programming Language (AMPL, http://ampl.com/).

At the end of this file you can find simple instructions about how to use or test this file, where to get information about AMPL,
eventually how to install it (the free version) and how to validate the installation through this same file.

*/

set PLACES;	# Set of places
set BUILDINGS; # Set of potential buildings

param INCIDENCE_MATRIX{PLACES,BUILDINGS} binary;  # The incidence matrix
param COST{BUILDINGS} >= 0;    # Cost of installation of each building

var x{BUILDINGS} binary; # Let's introduce a binary variable for each building, that indicates if we choose to build it (it will value 1) or not (it will value 0)

# Objective function definition: minimizing the total installation costs of buildings
minimize TotalInstallationCosts:
         sum{i in BUILDINGS} x[i] * COST[i];

# Constraints: every place must be covered by at least one building
subject to Covering{i in PLACES}: sum{j in BUILDINGS} INCIDENCE_MATRIX[i,j] * x[j] >= 1;








/* How to use/test this file
1. Without installing AMPL:
You can submit these files to one of the following online services:
	1.1
		one of the MIPs solvers listed on the page: http://www.neos-server.org/neos/solvers/
		- for example to Gurobi solver, with the AMPL interface:
        	http://www.neos-server.org/neos/solvers/milp:Gurobi/AMPL.html
        You can submit this current file setcovering_ampl_mod.txt (as .mod file) together with its related file setcovering_ampl_dat.txt (as .dat file)
        You will get the following answer:
        	optimal solution; objective 3
        	Objective = TotalInstallationCosts
        If you want to obtain a more detailed output, you should write your own .run file or adapt our setcovering_ampl_run.txt
        removing or uncommenting the lines where it is specified the Solver to use (the solver has to be chosen on the NEOS website).
        One really impressive feature of this website is that it offers the chance to experiment also models and solvers for several types of nonlinear programming.

		You can also use, as .dat file, the other version in the file named setcovering_ampl_dat_with_costs.txt,
		where every building has its related installation costs, different from one. The model is still valid and does not need to be changed.
		You will get the following answer:
		optimal solution; objective 25
        Objective = TotalInstallationCosts
   1.2.
      to the official service offered by AMPL: http://ampl.com/cgi-bin/ampl/amplcgi
      This second service answers in a faster way and it is more interactive, but you need to select lpsolve as solver if you want that it does not ignore integer constraints.

2. Launch this model on your local AMPL installation, using the following command:
	$ ampl setcovering_ampl_mod.txt setcovering_ampl_dat.txt setcovering_ampl_run.txt

	In this case, you need to be sure that the set Solver is among the ones already included in your local AMPL installation
	and that it handles integer constraints. For example, if you installed the Free Demo version, you can use cplex introducing (or decommenting) the line:
	option solver cplex;
	and removing (or commenting) other potential lines where you set other solvers.

	If your AMPL software works, you will get the advice to build the following buildings:
		MT, RM, SA
	choosing to build just 3 buildings.

	If you use the other .dat files, with installation costs different from 1, instead you will get the advice to build the following buildings:
		LE, LT, PT
	with total installation costs equal to 25.
*/
