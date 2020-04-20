/*
 * GENERATORE task triangolo
 * Edoardo Morassutto
 */ 

#include <iostream>
#include <cstdlib>
#include <cassert>

using namespace std;

// uso: ./generatore N maxW seed
// se N è negativo:
// -1: caso di esempio
// -2: 4 righe tutti 1
// -3: 4 righe tutti 0
// -4: 4 righe solo 0 e 1
// -5: 100 righe, tutti 99
int main(int argc, char** argv) {
	assert(argc == 2 || argc == 4);
	// numero di righe
	int N = atoi(argv[1]);
	
	if (N == -1) {
		cout << "5" << endl;
		cout << "7" << endl;
		cout << "3 8" << endl;		
		cout << "8 1 0" << endl;
		cout << "2 7 4 4" << endl;
		cout << "4 5 2 6 5" << endl;
		return 0;
	}
	else if (N == -2) {
		cout << "4" << endl;
		cout << "1" << endl;
		cout << "1 1" << endl;
		cout << "1 1 1" << endl;
		cout << "1 1 1 1" << endl;		
		return 0;
	}
	else if (N == -3) {
		cout << "4" << endl;
		cout << "0" << endl;
		cout << "0 0" << endl;
		cout << "0 0 0" << endl;
		cout << "0 0 0 0" << endl;
		return 0;
	}
	else if (N == -4) {
		cout << "4" << endl;
		cout << "0" << endl;
		cout << "0 1" << endl;
		cout << "0 1 0" << endl;
		cout << "1 0 0 1" << endl;		
		return 0;
	}
	else if (N == -5) {
		cout << 100 << endl;
		for (int i = 0; i < 100; i++) {
			for (int j = 0; j <= i; j++)
				cout << 99 << " ";
			cout << endl;
		}
		return 0;
	}
	assert(argc == 4);
	assert(N > 1 && N <= 100);
	// massimo valore nel triangolo
	int maxW = atoi(argv[2]);
	assert(maxW > 0 && maxW <= 100);
	// seed per rand
	int seed = atoi(argv[3]);
	
	srand(seed);
	
	cout << N << endl;
	// genera tutti i numeri casualmente
	for (int i = 0; i < N; i++) {
		for (int j = 0; j <= i; j++)
			cout << rand() % maxW << " ";
		cout << endl;
	}
	return 0;
}
