/*
  alberi 2020-05-13

  ci sono 3 modi di visitare un albero partendo da un nodo radice.
  Assumiamo i nodi siano labellati coi numeri naturali da 1 a N
  e che l'albero sia stato fornito ad esempio come:

input.txt
7
5 3 2 1 6 7 4 
2 6 7 1 3 4 5

ossia l'albero a 7 nodi e le due righe ripostano i nomi dei nodi come stampati
prima riga: dalla visita in pre-order
seconda riga: dalla visita in post-order

Entrambe le visite sono procedure ricorsive lanciate dalla rwadic

def visita in pre-order(v):
   stampa v
   per ogni figliolo u di v:
       visita in pre-order(u)


def visita in post-order(v);
   per ogni figliolo u di v:
       visita in pre-order(u)
   stampa v

Esiste un terzo modo di stampare i nodi (una terza permutazione) se l'albero è binario in senso stretto
(ogni nodo o è foglia o ha precisamente due figli, detto anche binario completo):

def visita_simmetrica(v):
  se v è foglia:
     stampa v
  altrimenti:
     visita_simmetrica(primo figlio di v)
     stampa v
     visita_simmetrica(secondo figlio di v)

Date le due stampe riportate in input.txt, riprodurre in output.txt la terza (visita simmetrica).

COMINCIAMO A RISOLVERE IL PROBLEMA:

VEDIAMO SE RIUSCIAMO A RICOSTRUIRE L'ALBERO DATE LE DUE SEQUENZE:

5 3 2 1 6 7 4 
2 6 7 1 3 4 5

CHI E' LA RADICE?  5
è il primo valore esternato dalla visita anticipata
e l'ultimo esternato dalla visita posticipata

PROVO A LEGARMI UN BRACCIO DIETRO LA SCHINA E VEDERE SE RISCO LEGGENDO SOLO LA PRIMA DELLE DUE PERMUTAZIONI

                 5
                3

E ora?
Non ho abbastanza dati.
Potrebbe infatti essere compatibile sia:
                   5
               3       4
             2   7
            1 6

Che:
                   5
               3       2
                     1   4
                    6 7

Quindi la prima da sola non basta e direi che nemmeno la seconda da sola basterà (per analogia, ma abbiamo anche capito
come potrei fare a convincermene in caso mi serva).

QUINDI LE DUE PERMUTAZIONI LE DOBBIAMO NECESSARIAMENTE USARE ENTRAMBE,
DEVO COGLIERE LA LORO SINERGIA NEL CATTURARE UNIVOCAMENTE L'ALBERO

5 3 2 1 6 7 4  --> 5 root, 3 figlio sinistro di root, 4 la foglia più a destra 
2 6 7 1 3 4 5  --> 5 root, 4 figlio destro, 2 la foglia più a sinistra

2,6,7,1 devono essere tutti quanti nel sottoalbero del 3.
4 è dall'altra parte.

Perchè?
perchè abbiamo detto che 3 è il figlio sinistro della radice (dalla prima riga)
e sappiamo che nella seconda tale nodo verrà stamato solo dopo aver terminato il suo sottoalbero.

Riassumiamo cosa siamo riiusciti a vedere:
1. chi è la radice
2. chi è il figlio sinistro della radice
3. chi sono i nodi del sottoalbero del figlio sinistro.

QUesto dovrebbe metterci in un contesto dove possiamo ragionare ricorsivamente.
Infatti, la struttura a sottoalberi è naturalmente ricorsiva:

AB(root) =      root
            AB(f1)  AB(f2)

Un albero binario completo o è un nodo, oppure è un nodo che ha per figli due alberi binari completi.

Vediamo se riusciamo a sfruttare la ricorsione mica solo per farci del male a ricostruire univocamente
l'albero del vero in memoria, ma sputare fuori direttamente l'output.

5 3 2 1 6 7 4 
2 6 7 1 3 4 5
________

Sappiamo ricostruzione l'albero:

Alb|5 3 2 1 6 7 4|  =                            5  
   |2 6 7 1 3 4 5|                            /    \
                                                  
       Alb|solo 2 6 7 1 3 in 5 3 2 1 6 7 4 |        Alb|eccetto 2 6 7 1 3 in  3 2 1 6 7 4 |         
          |2 6 7 1 3                       |           |                   4              |

Ma forse sappiamo anche risovere direttamente il problema:

Sol|5 3 2 1 6 7 4|  =                            
   |2 6 7 1 3 4 5|                            
                                                  
       Sol|solo 2 6 7 1 3 in   3 2 1 6 7 4 |    5    Sol|eccetto 2 6 7 1 3 in  3 2 1 6 7 4 |         
          |2 6 7 1 3                       |            |                   4              |

       Sol|3 2 1 6 7|    5    Sol| 4 |         
          |2 6 7 1 3|            | 4 |


In entrambe le formule ricorsive:
la stringa sotto del sottoproblema di sinistra è la stringa sotto del problema padre letta
fino al secondo nodo nella prima stringa.
la stringa sotto del sottoproblema di destra è la stringa sotto del problema padre letta a partire
da subito dopo quello che è il secondo nodo nella prima stringa e lasciando cadere l'ultimissimo.

la stringa sopra del sottoproblema di sinistra è la stringa sotto del problema padre letta
fino al secondo nodo nella prima stringa.
la stringa sopra del sottoproblema di destra è quella dal 4 in poi perchè avevamo detto che il 4
(penultimo della seconda stringa) doveva essere il secondo figlio della radice.


Un'esempio:
                         1
                 2                3
              4     5          6     7
            8   9  A  B       C  D  E  F


1   2   4  8 9  5  A B   3   6  C D  7  E F
8 9  4   A B  5    2    C D  6   E F  7   3    1
                   ^
                   |
                    qui termina il sottoalbero del figlio sinistro della radice

Riassumedo:
ragionando loalmente sulle due permutazioni riesco a individuare:
1. la radice (primo elmento di prima perm e ultimo elemento di seconda perm)
2. figlio sinistro della radice (secondo elemento di prima perm)
3. figlio destro della radice (penultimo elemento di seconda perm)

Con questi 3 elementi di conoscenza, sono in grado di offrire in semplicità
scomposizione ricorsiva del problema. 

Sol|perm1|  =                            
   |perm2|                            
                                                  
       Sol|perm1 tolto il primo e fino a dove penultimo di perm2 |   primo di perm1= ultimo di perm2    Sol| perm1 da dopo penultimo di perm2                         |         
          |perm2 fino a secondo di perm1                         |                                         | perm2 a partire da dopo secondo in perm1 e escluso ultimo|


*/

#include <cassert>
#include <cstdio>

using namespace std;

#define MAXN 1000010

static int N,i ;
static int preordine [MAXN] ;
static int postordine[MAXN] ;
static int simmetrica[MAXN] ;

void print(int *v, int N) {
  for(int i = 0; i<N; i++)
    fprintf(stderr,"%d ",v[i]);
  fprintf(stderr,"\n");  
}

void visita(int N, int *PRE, int *POST, int *SIMM )
// devo caricare in SIMM la permutazione simmetrica quando PRE contiene la permutazione in preorder e POST quella in postorder
// PRE e POST li posso usare solo in lettura
// N è il numero di nodi di mia competenza
{
/*
  char answ;
  fprintf(stderr,"Waiting ...");
  scanf("%c", &answ);
  printf("N=%d\n",N);
  print(PRE,N);
  print(POST,N);
  printf("Waiting ...");
  scanf("%c", &answ);
  */
  int root = PRE[0];
  assert(root == POST[N-1]);
  if(N == 1){
    SIMM[0] = root; 
  } else {
    int child1 = PRE[0];
    int child2 = PRE[0];
    int stop1 = 1;
    while(PRE[stop1] != POST[N-2])
      stop1++;
    int stop2 = 0;
    while(POST[stop2] != PRE[1])
      stop2++;
    //printf("stop1=%d\n",stop1);
    //printf("stop2=%d\n",stop2);
    
    visita(stop1-1, PRE+1, POST, SIMM);

    //printf("SIMM before writing:\n");
    //print(POST,N);
    SIMM[stop1-1] = root;
    //printf("SIMM after writing:\n");
    //print(POST,N);

    visita(N-stop1, PRE+stop1, POST+stop1-1, SIMM+stop1);
  }
}
  

int main(){
  FILE *fin, *fout;
#ifdef EVAL
  assert(fin = fopen("input.txt", "r"));
  assert(fout = fopen("output.txt", "w"));
#else
  fin = stdin;
  fout = stdout;
#endif
  assert(1==fscanf(fin, "%d", &N));
  
  for( i = 0 ; i < N ; i++ ) assert( 1 == fscanf(fin,"%d",preordine+i) );
  for( i = 0 ; i < N ; i++ ) assert( 1 == fscanf(fin,"%d",postordine+i) );

  visita(N,preordine,postordine,simmetrica);
  
  for( i = 0 ; i < N ; i++ ) fprintf(fout,"%d ",simmetrica[i]);
  fprintf(fout,"\n");
  
  return 0;
}


