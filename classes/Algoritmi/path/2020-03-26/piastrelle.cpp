#include<iostream>
#include <cstdio>
#include<cassert>
using namespace std;
const int MAXN = 1000000; int N;

int memoF[3], tempo[MAXN+1], t = 0;


int F(int n) {
  // ritorna il numero di piastrellature di un bagno 1xn.
  assert(n >= 0);
  if(memoF[n] != 0)
    return memoF[n];
  memoF[n] = F(n-2) + F(n-1);
  tempo[n] = ++t;
  return memoF[n];
}

/*
                 5
         4            3
    3      2       2   1
 2   1    1 0     1 0
1 0 
*/

/*
      5
    4   3
  3  2
 2 1
1 0 
*/

/*
        5
    3      4
  2  1    2  3
 0 1
*/


int main() {
#ifdef EVAL
        freopen("input.txt", "r", stdin);
        freopen("output.txt", "w", stdout);
#endif
  memoF[0] = memoF[1] = 1;
  tempo[0] = tempo[1] = 0;
  int N;
  cin >> N;
  for(int i = 2; i <= N; i++)
    memoF[i%3] = memoF[(i-1)%3] + memoF[(i-2)%3];
  cout << "F(" << N << ")= " << memoF[N%3] << endl;
 
  return 0;
}
