#include<iostream>
#include <cstdio>
#include<cassert>
using namespace std;
const int MAXN = 50; int N;

int p[2][MAXN];

int H(int n);
int G(int n);

int F(int n) {
  // ritorna il numero di piastrellature di un bagno 2xn ben squadrato.
  assert(n >= 0);
  if(n==0)
    return 1;
  if(n==1)
    return 2;
  return F(n-1) + G(n-1) + H(n-2);
}

int G(int n) {
  assert(n >= 0);
  if(n==0)
    return 1;
  return F(n) + G(n-1);
}

int H(int n) {
  assert(n >= 0);
  return F(n) + G(n);
}

void printP() {
  cout << "ciao N = " << N << endl; 
  for(int i=0; i<N; i++) {
//    assert( p[0][i] >= 1);
//    assert( p[0][i] <= 3);
    cout << p[0][i] << " ";
  } 
  cout << endl;
  for(int i=0; i<N; i++) {
//    assert( p[1][i] >= 1);
//    assert( p[1][i] <= 3);
    cout << p[1][i] << " ";
  } 
  cout << endl;
  return;
}

####

int listaH(int n);
int listaG(int n);

int listaF(int n) {
  // stampa uno ad uno i possibili modi di completare la
  // piastrellatura parziale del bagno 2xN
  // presente nella variabile p. La parte ancora bianca (0) entro p
  // forma un sottobagno ben quadrato 2xn
  assert(n >= 0);
  if(n==0)
    printP();
    return;
  if(n==1)
    int min_free = 1;
    if(min_free == p[0][N-2]) min_free++;
    if(min_free == p[1][N-2]) min_free++;
    if(min_free == p[0][N-2]) min_free++;
    int col2 = min_free+1;
    if(col2 == p[0][N-2]) col2++;
    if(col2 == p[1][N-2]) col2++;
    if(col2 == p[0][N-2]) col2++;
    p[0][N-2] = p[1][N-2] = min_free; 
    printP();
    p[0][N-2] = p[1][N-2] = min_free; 


    printP();    
    return;
  return listaF(n-1) + listaG(n-1) + listaH(n-2);
}

int listaG(int n) {
  assert(n >= 0);
  if(n==0)
    return 1;
  return listaF(n) + listaG(n-1);
}

int listaH(int n) {
  assert(n >= 0);
  return listaF(n) + listaG(n);
}


####

        
int main() {
#ifdef EVAL
        freopen("input.txt", "r", stdin);
        freopen("output.txt", "w", stdout);
#endif
  cin >> N;
  cout << listaF(N) << endl;
  printP();
  return 0;
}
