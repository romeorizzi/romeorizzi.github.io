#include<iostream>
using namespace std;

int largest_power_of_2_in(int n) {
  int lp = 1;
  while(2*lp <= n)
    lp *= 2;
  return lp;
}

int main() {
  int n;
  cin >> n;
  int risp = 0;
  while(n > 1) {
    // guess(largest_power_of_2_in(n))
    //cout << "n=" << n << "largest_power_of_2=" << largest_power_of_2_in(n) << endl;
    risp += 1;
    n = largest_power_of_2_in(n) -1; 
  }
  cout << risp << endl;
  return 0;
}
