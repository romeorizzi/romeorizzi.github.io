#include<iostream>
#include<cassert>

using namespace std;

unsigned long long int num_mosse(int n) {
// ritorna il minimo numero di mosse che consente di spostare una torre di Hanoi di n dischi
    assert( n >= 0);
    if (n==0)
        return 0;
    return 2*num_mosse(n-1)+1;    
}

void sposta_disco(int n, char piolo_from, char piolo_to) {
    cout << "sposta il disco " << n << " da " << piolo_from << " a " << piolo_to << endl;
}

void sposta_torre(int n, char piolo_from, char piolo_to, char piolo_aux) {
// sposta la torre di Hanoi di n dischi
    assert( n >= 0);
    if (n==0)
        return;
    //int piolo_aux = 6 - piolo_from -piolo_to;
    sposta_torre(n-1, piolo_from, piolo_aux, piolo_to);
    sposta_disco(n, piolo_from, piolo_to);  
    sposta_torre(n-1, piolo_aux, piolo_to, piolo_from);    
}

int main() {
    int N;
    cin >> N;
    cout << "Num mosse: " << num_mosse(N) << endl;
    sposta_torre(N,'A','C','B');
    return 0;
}