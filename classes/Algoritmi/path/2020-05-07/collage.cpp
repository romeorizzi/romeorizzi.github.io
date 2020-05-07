#include<iostream>
#include<cassert>
#include<cstdio>
using namespace std;
const int MAXN = 1000;

int N, seq[MAXN];

int memo[MAXN][MAXN];

int Min(int i, int j){
// ritorna il minimo numero di fogli per comporre l'arcobaleno seq[i...j] (estremi inclusi)
	//cout << "i=" << i << "j=" j << endl;
	//printf("i=%d\tj=%d", i,j);
    assert(i >= 0);
    assert(j >= i-1);
    assert(j <= N-1);
	if (i > j) return 0;
	if (i == j) return 1;
	if (memo[i][j] > 0) return memo[i][j];
    int ret;  // devo trovare il meglio sulle varie ipotesi di dove riaffiora il primo foglio
	ret = 1 + Min(i+1,j); // se il foglio non raffiora piu'
	for(int ii= i+1; ii <= j; ii++){
	   if(seq[ii]==seq[i]){  // se il foglio riaffiora in ii per la prima volta
		   ret = min(ret,
			   Min(i + 1, ii - 1) +
			   Min(ii, j));
       }
	} 
    return memo[i][j] = ret;
}


int PD(){
// ritorna il minimo numero di fogli per comporre l'arcobaleno seq
    for(int i=N-1; i>=0; i--)
        for(int j=i-1; j<N; j++) {
  	    	if (i > j) memo[i][j] = 0;
	    	else if (i == j) memo[i][j] = 1;
			else {
				memo[i][j] = 1 + memo[i+1][j]; // se il foglio non raffiora piu'
				for(int ii= i+1; ii <= j; ii++){
					if(seq[ii]==seq[i]){  // se il foglio riaffiora in ii per la prima volta
						memo[i][j] = min(memo[i][j],
							memo[i + 1][ii- 1] + memo[ii][j]);
					}
				}
			} 
		}
    return memo[0][N-1];
}




int main() {

	//leggo lunghezza della sequenza
	cin >> N;
	assert((N > 0) && (N <= MAXN));
	//memorizzo in un array la sequenza
	for (int i = 0; i < N; ++i) {
		cin >> seq[i];
	}

//	for (int i = 0; i < N; ++i) {
//		cout << seq[i] << "   ";
//	}

	int n = Min(0,N-1);
    cout << endl << n << endl;
    cout << "ciao" << endl;
    assert(n == PD());

	return 0;
}

/*
memory: O(N^2)
time: O(N^3)
*/


/*
	int tmp, prev = -1;
	int realPos = 0;
	//memorizzo in un array la sequenza eliminando i colori uguali consecutivi
	for(int i = 0; i < N; ++i) {
		cin >> tmp;
		if (tmp != prev) {
			p[realPos++] = tmp;
			prev = tmp;
		}
	}
*/