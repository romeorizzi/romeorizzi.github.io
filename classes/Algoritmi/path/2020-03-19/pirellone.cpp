#include<iostream>
#include <cstdio>
#include<cassert>
using namespace std;
const int MAXM = 5000, MAXN = 5000; int M, N;
int p[MAXM][MAXN];

int solvable() {
  int risp = 1;
  for(int i = 1; i<M; i++)
     for(int j = 1; j < N; j++)
	 if( (p[i][j]+p[i][0]+p[0][j]+p[0][0]) % 2 != 0 )
	     risp = 0;	 
  return risp;
}

int main() {
#ifdef EVAL
        freopen("input.txt", "r", stdin);
        freopen("output.txt", "w", stdout);
#endif
  cin >> M >> N;
  for(int i = 0; i < M; i++)
	for(int j = 0; j < N; j++)
	      cin >> p[i][j];
  if(solvable()) {
    for(int i = 0; i < M; i++)
      cout << p[i][0] << " ";
    cout << endl;
    for(int j = 0; j < N; j++)
      cout << (p[0][j] +p[0][0] ) %2 << " ";
    cout << endl;
  }
  else {
    for(int i = 0; i < M; i++)
      cout << "0 ";
    cout << endl;
    for(int j = 0; j < N; j++)
      cout << "0 ";
    cout << endl;
  }


 // for(int i = 0; i < M; i++) {
 //       for(int j = 0; j < N; j++)
 //             cout << p[i][j] << " ";
//	cout << endl;
//  }
//  cout << endl;




  return 0;
}
