#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *m[] = {"enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"};

int charToInt(char n){
  int aux;
  if(n=='0')
    aux = 0;
  else if(n=='1')
    aux = 1;
  else if(n=='2')
    aux = 2;
  else if(n=='3')
    aux = 3;
  else if(n=='4')
    aux = 4;
  else if(n=='5')
    aux = 5;
  else if(n=='6')
    aux = 6;
  else if(n=='7')
    aux = 7;
  else if(n=='8')
    aux = 8;
  else if(n=='9')
    aux = 9;
  return aux;
}

int unir2Numeros(int n1, int n2){
  int aux;
  aux = n1 * 10 + n2;
  return aux;
}

int unir4Numeros(int n1, int n2, int n3, int n4){
  int aux;
  aux = n1 * 1000 + n2 * 100 + n3 * 10 + n4;
  return aux;
}

int evaluarDia(int n, int mes){
  if((mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes==10 || mes==12) && (n>=1 && n<=31))
    return 1;
  else if((mes==4 || mes==6 || mes==9 || mes==11) && (n>=1 && n<=30))
    return 1;
  else if(mes==2 && (n>=1 && n<=29))
    return 1;
  else return -1;
}

int evaluarMes(int n){
  if(n>=1 && n<=12)
    return 1;
  else return -1;
}

void traducirMes(int n, char *m[]){
  printf("%s\n",m[n-1]);
}

void traducirAnio(int n, int largo){
  int aux;
  if(largo == 2){
    if(n>16)
      aux = 1900 + n;
    else
      aux = 2000 + n;
    printf("%d\n",aux);
  }

  else if(largo == 4){
    if(n>=1000)
      printf("%d\n",n);
  }
}  

int main()
{
  /* code */
  int n = unir2Numeros(charToInt('1'),charToInt('2'));
  printf("%d\n", n);

  int aux = unir4Numeros(charToInt('1'),charToInt('1'),charToInt('1'),charToInt('1'));
  printf("%c\n", aux);

  traducirAnio(n, 2);
  return 0;
}