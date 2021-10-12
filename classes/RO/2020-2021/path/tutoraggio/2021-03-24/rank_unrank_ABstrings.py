
def ABstring2rank(s):
    a=0
    b=2**(len(s))
    for i in range(0,len(s)):
        if s[i]=="A":
            b=b-((b-a)/2)
        else:
            a=a+((b-a)/2)
    return int(a)

def ABstring_of_len_and_rank(length, r):
    s=""
    a=0
    b=2**(length)
    for i in range(0,length):
        val=(b-a)/2
        if a<=r and r<b-val:
            s+="A"
            b=b-val
        if a+val<=r and r<b:
            s+="B"
            a=a+val
    return s       

##Gestione input
input_string = input("Inserisci l'input: ")

if input_string[0] == 'A' or input_string[0] == 'B':
   print( ABstring2rank(input_string) )
else:
   length, r = input_string.split()
   print( ABstring_of_len_and_rank(int(length), int(r)) )

