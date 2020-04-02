#include<iostream>
#include <cstdio>
#include<cassert>
using namespace std;
const int MAXM = 5000, MAXN = 5000; int M, N;
int p[MAXM][MAXN];

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

int main() {
#ifdef EVAL
        freopen("input.txt", "r", stdin);
        freopen("output.txt", "w", stdout);
#endif
  int N;
  cin >> N;
  cout << F(N) << endl;
  return 0;
}
