/*
 * GENERATORE task poldo
 * Usage: ./generatore N maxW seed
 *  N >= 1, il numero di panini
 *  maxW >= 0, i valori degli N panini saranno tutti compresi tra 0 e maxW
 *  Casi Particolari:
 *      se N==-2 allora si genera la sequenza 1 2 ... 1000
 *      se N==-1 allora si genera la sequenza 1000 999 ... 1
 */ 

#include <iostream>
#include <cassert>
#include <cstdlib>

using namespace std;

int main(int argc, char** argv) {
	assert(argc > 1);
	int N = atoi(argv[1]);
	if ( (N == -1) || (N == -2) ) {
	  cout << 10000 << endl;
	  for (int i = 0; i < 10000; i++)
	    if (N == -1)
	      cout << 10000-i << endl;
	    else
              cout << i+1 << endl;
	  return 0;
	}
	assert(argc == 4);
	int maxW = atoi(argv[2]);
	int seed = atoi(argv[3]);
	srand(seed);
	cout << N << endl;
	for (int i = 0; i < N; i++)
	  cout << rand() % maxW << endl;
	return 0;
}
