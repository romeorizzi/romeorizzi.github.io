#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <vector>
#define MAXN 1000000

using namespace std ;
int L[MAXN] , R[MAXN] , LABEL[MAXN] ;
int N , S ;
vector<int> leaf ;

void pre(int pos)
{
	printf("%d ",LABEL[pos]);
	if( L[pos] != 0 ) pre(L[pos]);
	if( R[pos] != 0 ) pre(R[pos]);
}

void post(int pos)
{
	if( L[pos] != 0 ) post(L[pos]);
	if( R[pos] != 0 ) post(R[pos]);
	printf("%d ",LABEL[pos]);
}

void simm(int pos)
{
	if( L[pos] != 0 ) simm(L[pos]);
	printf("%d ",LABEL[pos]);
	if( R[pos] != 0 ) simm(R[pos]);
}

void swap( int *a, int *b ){ int t = *a ; *a = *b ; *b = t ; }

int main( int argc, char **argv)
{
	assert( argc == 3 );
	N = atoi(argv[1]) ;
	S = atoi(argv[2]) ;
	
	srand(S);
	leaf.push_back(1);
	int node = 1 ;
	while( node < N )
	{
		int idxLeaf = rand()%leaf.size();
		int posLeaf = leaf[idxLeaf] ;
		L[posLeaf] = ++node ;
		R[posLeaf] = ++node ;
		leaf[idxLeaf] = L[posLeaf] ;
		leaf.push_back( R[posLeaf]);	
	}
	for( int i = 1 ; i <= N ; i++ ) LABEL[i] = i ;
	for( int i = 1 ; i <= N ; i++ ) swap( &LABEL[i], &LABEL[rand()%N+1] );
	printf("%d\n",node);
	 pre(1); printf("\n");
	post(1); printf("\n");
	
}
