#include <stdio.h>
#include <stdlib.h>


int validarArchivo(char *arch){
    FILE *archivo;
    archivo = fopen(arch, "r");
    if(archivo == NULL)
        return 0;
    else
        return 1;
}

int checkparameters(int argc){
  if(argc == 1){
    printf("Error: Faltan par\240metros en la l\241nea de comandos.\n");
    printf("Uso: fechas.exe archivo_entrada archivo_salida");
    return 0;
  }
  else if(argc == 2){
    printf("Error: Falta par\240metro en la l\241nea de comandos.\n");
    printf("Uso: fechas.exe archivo_entrada archivo_salida");
    return 0;
  }
  else if(argc > 3){
    printf("Error: Demasiados par\240metros en la l\241nea de comandos.\n");
    printf("Uso: fechas.exe archivo_entrada archivo_salida");
    return 0;
  }
  return 1;
}

int contarCaracteres(char *arch){
  FILE *archivo;
  char caracter;
  int contador = 0;
  archivo = fopen(arch,"r");

  while (feof(archivo) == 0){
    caracter = fgetc(archivo);
    contador++;
  }

  fclose(archivo);
  return contador;
}

void leerArchivo(char *arch, int n, char arr[]){
  FILE *archivo;
  char caracter;
  int i = 0;
  archivo = fopen(arch,"r");
  
  while (feof(archivo) == 0){
    caracter = fgetc(archivo);
    arr[i] = caracter;
    i++;
  }

  fclose(archivo);
}

int esNumero(char n){
    if(n>='0' && n<='9')
        return 1;
    else return -1;
}

int esSeparador(char n){
    if(n=='/' || n=='-')
        return 1;
    else return -1;
}

int esFin(char n){
    if(n==' ' || n=='\n' || n==EOF || esNumero(n)!=1)
        return 1;
    else return -1;
}


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

int unirNumeros(int n1, int n2){
  int aux;
  if(n1==0)
    aux = n2;
  else if(n1==1)
    aux = 10 + n2;
  else if(n1==2)
    aux = 20 + n2;
  else if(n1==3)
    aux = 30 + n2;
  else if(n1==4)
    aux = 40 + n2;
  else if(n1==5)
    aux = 50 + n2;
  else if(n1==6)
    aux = 60 + n2;
  else if(n1==7)
    aux = 70 + n2;
  else if(n1==8)
    aux = 80 + n2;
  else if(n1==9)
    aux = 90 + n2;
  return aux;
}

int evaluarDia(int i, char a[], int n){
  if(n==1){
    if(a[i]>='1' && a[i]<='9')
      return 1;
    else return -1;
  }
  else if(n==2){
    if((a[i]>='0' && a[i]<='3') && (a[i]>='0' && a[i]<='9')){
      if(a[i]=='0' && (a[i+1]>='1' && a[i+1]<='9'))
        return 1;
      else if((a[i]=='1' || a[i]=='2') && (a[i+1]>='0' && a[i+1]<='9'))
        return 1;
      else if(a[i]=='3' && (a[i+1]=='0' || a[i+1]=='1'))
        return 1;
      else return -1;
    }
    else return -1;
  }
}

int evaluarMes(int i, char a[], int n){
  if(n==1){
    if(a[i]>='1' && a[i]<='9')
      return 1;
    else return -1;
  }
  else if(n==2){
    if((a[i]=='0' || a[i]=='1') && (a[i]>='0' && a[i]<='9')){
      if(a[i]=='0' && (a[i+1]>='1' && a[i+1]<='9'))
        return 1;
      else if(a[i]=='1' && (a[i+1]>='0' && a[i+1]<='2'))
        return 1;
      else return -1;
    }
    else return -1;
  }
}

int evaluarAnio(int i, char a[], int n){
  if(n==2){
    if((a[i]>='0' && a[i]<='9') && (a[i]>='0' && a[i]<='9'))
      return 1;
    else return -1;
  }
  if(n==4){
    if((a[i]>='1' && a[i]<='9') && (a[i]>='0' && a[i]<='9') && (a[i]>='0' && a[i]<='9') && (a[i]>='0' && a[i]<='9'))
      return 1;
    else return -1;
  }
}

int verificarDiaMes(char a[], int iDia, int largoDia, int iMes, int largoMes){
  int auxDia, auxMes, aux1, aux2;
  if(largoDia==1)
    auxDia = charToInt(a[iDia]);
  if(largoDia==2){
    aux1 = charToInt(a[iDia]);
    aux2 = charToInt(a[iDia+1]);
    auxDia = unirNumeros(aux1, aux2);
  }
  if(largoMes==1)
    auxMes = charToInt(a[iMes]);
  if(largoMes==2){
    aux1 = charToInt(a[iMes]);
    aux2 = charToInt(a[iMes+1]);
    auxMes = unirNumeros(aux1, aux2);
  }

  if(auxDia<=31 && (auxMes==1 || auxMes==3 || auxMes==5 || auxMes==7 || auxMes==8 || auxMes==10 || auxMes==12))
    return 1;
  else if(auxDia<=30 && (auxMes==4 || auxMes==6 || auxMes==9 || auxMes==11))
    return 1;
  else if(auxDia<=29 && auxMes==2)
    return 1;
  else 
    return -1;
}

/*void traducirAnio(int i, char a[], int n){
  int aux1, aux2, aux3;
  if(n==2){
    aux1 = charToInt(a[i]);
    aux2 = charToInt(a[i+1]);
    aux3 = unirNumeros(aux1, aux2);

    if(aux3 <= 16)
  }
}*/

void traducirMes(int i, char a[], int n, char m[]){
  int aux1, aux2, aux3;
  if(n==1){
    aux1 = charToInt(a[i]);
    a[i] = m[aux1-1];
  }
  if(n==2){
    aux2 = charToInt(a[i]);
    aux3 = charToInt(a[i+1]);
    aux1 = unirNumeros(aux2, aux3);
    a[i] = '|';
    a[i+1] = m[aux1-1];
  }
}

void traducir(int n, char a[], char m[]){
  int i = 0;
  while(i<n){
    if((i+2)<n && esNumero(a[i])==1 && esSeparador(a[i+1])==1 && esNumero(a[i+2])==1){
      if((i+6)<n && esSeparador(a[i+3])==1 && esNumero(a[i+4])==1 && esNumero(a[i+5])==1 && esFin(a[i+6])==1){ 
        // d/d/dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 1)==1 && evaluarAnio(i+4, a, 2)==1){
          traducirMes(i+2, a, 1, m);
          a[i+1]='_';
          a[i+3]='_';
          i+=6;
        }
        else i+=1;
      }
      else if((i+8)<n && esSeparador(a[i+3])==1 && esNumero(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6]) && esNumero(a[i+7]) && esFin(a[i+8])==1){ 
        // d/d/dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 1)==1 && evaluarAnio(i+4, a, 4)==1){
          traducirMes(i+2, a, 1, m);
          a[i+1]='_';
          a[i+3]='_';
          i+=8;
        }
        else i+=1;
      }
      else if((i+7)<n && esSeparador(a[i+3])==1 && a[i+4]==' ' && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esFin(a[i+7])==1){ 
        // d/d/ dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 1)==1 && evaluarAnio(i+5, a, 2)==1){
          traducirMes(i+2, a, 1, m);
          a[i+1]='_';
          a[i+3]='_';
          a[i+4]='|';
          i+=7;
        }
        else i+=1;
      }
      else if((i+9)<n && esSeparador(a[i+3])==1 && a[i+4]==' ' && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){
        // d/d/ dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 1)==1 && evaluarAnio(i+5, a, 4)==1){
          traducirMes(i+2, a, 1, m);
          a[i+1]='_';
          a[i+3]='_';
          a[i+4]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+7)<n && a[i+3]==' ' && esSeparador(a[i+4])==1  && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esFin(a[i+7])==1){ 
        // d/d /dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 1)==1 && evaluarAnio(i+5, a, 2)==1){
          traducirMes(i+2, a, 1, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+3]='|';
          i+=7;
        }
        else i+=1;
      }
      else if((i+9)<n && a[i+3]==' ' && esSeparador(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){
        // d/d /dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 1)==1 && evaluarAnio(i+5, a, 4)==1){
          traducirMes(i+2, a, 1, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+3]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+8)<n && a[i+3]==' ' && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d/d / dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+2, a, 1, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+3]='|';
          a[i+5]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && a[i+3]==' ' && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){
        // d/d / dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+2, a, 1, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+3]='|';
          a[i+5]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+3)<n && esFin(a[i+3])==1){ 
        // d/d
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 1)==1){
          traducirMes(i+2, a, 1, m);
          a[i+1]='_';
          i+=3;
        }
        else i+=1;
      }

      else if((i+7)<n && esNumero(a[i+3])==1 && esSeparador(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esFin(a[i+7])==1){ 
        // d/dd/dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 2)==1 && evaluarAnio(i+5, a, 2)==1){
          traducirMes(i+2, a, 2, m);
          a[i+1]='_';
          a[i+4]='_';
          if(a[i+2]=='0')
            a[i+2]='|';
          i+=7;
        }
        else i+=1;
      }
      else if((i+9)<n && esNumero(a[i+3])==1 && esSeparador(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7]) && esNumero(a[i+8]) && esFin(a[i+9])==1){ 
        // d/dd/dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 2)==1 && evaluarAnio(i+5, a, 4)==1){
          traducirMes(i+2, a, 2, m);
          a[i+1]='_';
          a[i+4]='_';
          if(a[i+2]=='0')
            a[i+2]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+8)<n && esNumero(a[i+3])==1 && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d/dd/ dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 2)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+2, a, 2, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+5]='|';
          if(a[i+2]=='0')
            a[i+2]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+3])==1 && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){
        // d/dd/ dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 2)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+2, a, 2, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+5]='|';
          if(a[i+2]=='0')
            a[i+2]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+8)<n && esNumero(a[i+3])==1 && a[i+4]==' ' && esSeparador(a[i+5])==1  && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d/dd /dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 2)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+2, a, 2, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+4]='|';
          if(a[i+2]=='0')
            a[i+2]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+3])==1 && a[i+4]==' ' && esSeparador(a[i+5])==1  && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){
        // d/dd /dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 2)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+2, a, 2, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+4]='|';
          if(a[i+2]=='0')
            a[i+2]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && esNumero(a[i+3])==1 && a[i+4]==' ' && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d/dd / dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+2, a, 2, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+4]='|';
          a[i+6]='|';
          if(a[i+2]=='0')
            a[i+2]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+3])==1 && a[i+4]==' ' && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // d/dd / dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+2, a, 2, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+4]='|';
          a[i+6]='|';
          if(a[i+2]=='0')
            a[i+2]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+4)<n && esNumero(a[i+3])==1 && esFin(a[i+4])==1){ 
        // d/dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+2, a, 2)==1){
          traducirMes(i+2, a, 2, m);
          a[i+1]='_';
          if(a[i+2]=='0')
            a[i+2]='|';
          i+=4;
        }
        else i+=1;
      }
      else i+=1;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    else if((i+3)<n && esNumero(a[i])==1 && esSeparador(a[i+1])==1 && a[i+2]==' ' && esNumero(a[i+3])==1){
      if((i+7)<n && esSeparador(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esFin(a[i+7])==1){ 
        // d/ d/dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+5, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+2]='|';
          i+=7;
        }
        else i+=1;
      }
      else if((i+9)<n && esSeparador(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7]) && esNumero(a[i+8]) && esFin(a[i+9])==1){ 
        // d/ d/dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+5, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+2]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+8)<n && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d/ d/ dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+2]='|';
          a[i+5]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){
        // d/ d/ dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+1]='_';
          a[i+4]='_';
          a[i+2]='|';
          a[i+5]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+8)<n && a[i+4]==' ' && esSeparador(a[i+5])==1  && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d/ d /dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+2]='|';
          a[i+4]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && a[i+4]==' ' && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){
        // d/ d /dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+2]='|';
          a[i+4]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && a[i+4]==' ' && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d/ d / dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+6]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && a[i+4]==' ' && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // d/ d / dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+6]='|';
          i+=11;
        }
        else i+=1;
      }

      else if((i+4)<n && esFin(a[i+4])==1){ 
        // d/ d
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1){
          traducirMes(i+3, a, 1, m);
          a[i+1]='_';
          a[i+2]='|';
          i+=4;
        }
        else i+=1;
      }

      else if((i+8)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d/ dd/dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+2]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8]) && esNumero(a[i+9]) && esFin(a[i+10])==1){ 
        // d/ dd/dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+2]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d/ dd/ dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+2]='|';
          a[i+6]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // d/ dd/ dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+1]='_';
          a[i+5]='_';
          a[i+2]='|';
          a[i+6]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+9)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1  && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d/ dd /dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+1]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+5]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1  && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // d/ dd /dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+1]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+5]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // d/ dd / dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+1]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // d/ dd / dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+1]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+5)<n && esNumero(a[i+4])==1 && esFin(a[i+5])==1){ 
        // d/ dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+1]='_';
          a[i+2]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=5;
        }
        else i+=1;
      }
      else i+=1;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    else if((i+3)<n && esNumero(a[i])==1 && a[i+1]==' ' && esSeparador(a[i+2])==1 &&  esNumero(a[i+3])==1){
      if((i+7)<n && esSeparador(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esFin(a[i+7])==1){ 
        // d /d/dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+5, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+4]='_';
          a[i+1]='|';
          i+=7;
        }
        else i+=1;
      }
      else if((i+9)<n && esSeparador(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7]) && esNumero(a[i+8]) && esFin(a[i+9])==1){ 
        // d /d/dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+5, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+4]='_';
          a[i+1]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+8)<n && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d /d/ dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+4]='_';
          a[i+1]='|';
          a[i+5]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){
        // d /d/ dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+4]='_';
          a[i+1]='|';
          a[i+5]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+8)<n && a[i+4]==' ' && esSeparador(a[i+5])==1  && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d /d /dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+4]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && a[i+4]==' ' && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){
        // d /d /dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+4]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && a[i+4]==' ' && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d /d / dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+4]='|';
          a[i+6]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && a[i+4]==' ' && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // d /d / dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+4]='|';
          a[i+6]='|';
          i+=11;
        }
        else i+=1;
      }

      else if((i+4)<n && esFin(a[i+4])==1){ 
        // d /d
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 1)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+1]='|';
          i+=4;
        }
        else i+=1;
      }

      else if((i+8)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d /dd/dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8]) && esNumero(a[i+9]) && esFin(a[i+10])==1){ 
        // d /dd/dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d /dd/ dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+6]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // d /dd/ dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+6]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+9)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1  && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d /dd /dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+5]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1  && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // d /dd /dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+5]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // d /dd / dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // d /dd / dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=112;
        }
        else i+=1;
      }
      else if((i+5)<n && esNumero(a[i+4])==1 && esFin(a[i+5])==1){ 
        // d /dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+3, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+1]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=5;
        }
        else i+=1;
      }
      else i+=1;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    else if((i+4)<n && esNumero(a[i])==1 && a[i+1]==' ' && esSeparador(a[i+2])==1 && a[i+3]==' ' &&  esNumero(a[i+4])==1){
      if((i+8)<n && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // d / d/dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+3]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8]) && esNumero(a[i+9]) && esFin(a[i+10])==1){ 
        // d / d/dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+3]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d / d/ dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+6]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // d / d/ dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+6]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+9)<n && a[i+5]==' ' && esSeparador(a[i+6])==1  && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d / d /dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+5]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && a[i+5]==' ' && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // d / d /dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+5]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // d / d / dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+5]='|';
          a[i+7]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // d / d / dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+5]='|';
          a[i+7]='|';
          i+=12;
        }
        else i+=1;
      }

      else if((i+6)<n && esNumero(a[i+5])==1 && esFin(a[i+6])==1){ 
        // d / dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+1]='|';
          a[i+3]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=6;
        }
        else i+=1;
      }
      else if((i+9)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // d / dd/dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+3]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9]) && esNumero(a[i+10]) && esFin(a[i+11])==1){ 
        // d / dd/dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+3]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // d / dd/ dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+7]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // d / dd/ dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+7]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1  && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // d / dd /dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+7]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+6]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1  && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // d / dd /dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+7]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+6]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){ 
        // d / dd / dd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+9, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+7]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+6]='|';
          a[i+8]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+13)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esNumero(a[i+12])==1 && esFin(a[i+13])==1){
        // d / dd / dddd
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+9, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+7]='_';
          a[i+1]='|';
          a[i+3]='|';
          a[i+6]='|';
          a[i+8]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=13;
        }
        else i+=1;
      }
      else if((i+5)<n && esFin(a[i+5])==1){ 
        // d / d
        if(evaluarDia(i, a, 1)==1 && evaluarMes(i+4, a, 1)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+1]='|';
          a[i+3]='|';
          i+=5;
        }
        else i+=1;
      }
      else i+=1;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    else if((i+3)<n && esNumero(a[i])==1 && esNumero(a[i+1])==1 && esSeparador(a[i+2])==1 &&  esNumero(a[i+3])==1){
      if((i+7)<n && esSeparador(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esFin(a[i+7])==1){ 
        // dd/d/dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+5, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+4]='_';
          if(a[i]=='0')
            a[i]='|';
          i+=7;
        }
        else i+=1;
      }
      else if((i+9)<n && esSeparador(a[i+4])==1 && esNumero(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7]) && esNumero(a[i+8]) && esFin(a[i+9])==1){ 
        // dd/d/dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+5, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+4]='_';
          if(a[i]=='0')
            a[i]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+8)<n && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // dd/d/ dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+4]='_';
          a[i+5]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esSeparador(a[i+4])==1 && a[i+5]==' ' && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){
        // dd/d/ dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+4]='_';
          a[i+5]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+8)<n && a[i+4]==' ' && esSeparador(a[i+5])==1  && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // dd/d /dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+4]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && a[i+4]==' ' && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){
        // dd/d /dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+4]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && a[i+4]==' ' && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd/d / dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+4]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && a[i+4]==' ' && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // dd/d / dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+4]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+4)<n && esFin(a[i+4])==1){ 
        // dd/d
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 1)==1){
          traducirMes(i+3, a, 1, m);
          a[i+2]='_';
          if(a[i]=='0')
            a[i]='|';
          i+=4;
        }
        else i+=1;
      }

      else if((i+8)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // dd/dd/dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+5]='_';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8]) && esNumero(a[i+9]) && esFin(a[i+10])==1){ 
        // dd/dd/dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+5]='_';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd/dd/ dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+4])==1 && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // dd/dd/ dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+9)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1  && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd/dd /dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+5]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1  && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // dd/dd /dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+5]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd/dd / dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+4])==1 && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // dd/dd / dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+5)<n && esNumero(a[i+4])==1 && esFin(a[i+5])==1){ 
        // dd/dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+3, a, 2)==1){
          traducirMes(i+3, a, 2, m);
          a[i+2]='_';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+3]=='0')
            a[i+3]='|';
          i+=5;
        }
        else i+=1;
      }
      else i+=1;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    else if((i+4)<n && esNumero(a[i])==1 && esNumero(a[i+1])==1 && esSeparador(a[i+2])==1 && a[i+3]==' ' &&  esNumero(a[i+4])==1){
      if((i+8)<n && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // dd/ d/dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+3]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8]) && esNumero(a[i+9]) && esFin(a[i+10])==1){ 
        // dd/ d/dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+3]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd/ d/ dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+3]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // dd/ d/ dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+5]='_';
          a[i+3]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+9)<n && a[i+5]==' ' && esSeparador(a[i+6])==1  && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd/ d /dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+3]='|';
          a[i+5]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && a[i+5]==' ' && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // dd/ d /dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+3]='|';
          a[i+5]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd/ d / dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+3]='|';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // dd/ d / dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+3]='|';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+5)<n && esFin(a[i+5])==1){ 
        // dd/ d
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1){
          traducirMes(i+4, a, 1, m);
          a[i+2]='_';
          a[i+3]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=5;
        }
        else i+=1;
      }

      else if((i+9)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd/ dd/dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+3]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9]) && esNumero(a[i+10]) && esFin(a[i+11])==1){ 
        // dd/ dd/dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+3]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd/ dd/ dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+3]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // dd/ dd/ dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+6]='_';
          a[i+3]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1  && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd/ dd /dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+7]='_';
          a[i+3]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1  && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // dd/ dd /dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+7]='_';
          a[i+3]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){ 
        // dd/ dd / dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+9, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+7]='_';
          a[i+3]='|';
          a[i+6]='|';
          a[i+8]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+13)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esNumero(a[i+12])==1 && esFin(a[i+13])==1){
        // dd/ dd / dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+9, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+7]='_';
          a[i+3]='|';
          a[i+6]='|';
          a[i+8]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=13;
        }
        else i+=1;
      }
      else if((i+6)<n && esNumero(a[i+5])==1 && esFin(a[i+6])==1){ 
        // dd/ dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+2]='_';
          a[i+3]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=6;
        }
        else i+=1;
      }
      else i+=1;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    else if((i+4)<n && esNumero(a[i])==1 && esNumero(a[i+1])==1 && a[i+2]==' ' && esSeparador(a[i+3])==1 && esNumero(a[i+4])==1){
      if((i+8)<n && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esFin(a[i+8])==1){ 
        // dd /d/dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+6, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+3]='_';
          a[i+5]='_';
          a[i+2]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=8;
        }
        else i+=1;
      }
      else if((i+10)<n && esSeparador(a[i+5])==1 && esNumero(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8]) && esNumero(a[i+9]) && esFin(a[i+10])==1){ 
        // dd /d/dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+6, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+3]='_';
          a[i+5]='_';
          a[i+2]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+9)<n && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd /d/ dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+3]='_';
          a[i+5]='_';
          a[i+2]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esSeparador(a[i+5])==1 && a[i+6]==' ' && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // dd /d/ dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+3]='_';
          a[i+5]='_';
          a[i+2]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+9)<n && a[i+5]==' ' && esSeparador(a[i+6])==1  && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd /d /dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+5]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && a[i+5]==' ' && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){
        // dd /d /dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+5]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd /d / dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+4, a, 1, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && a[i+5]==' ' && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // dd /d / dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+4, a, 1, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+5]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+5)<n && esFin(a[i+5])==1){ 
        // dd /d
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 1)==1){
          traducirMes(i+4, a, 1, m);
          a[i+3]='_';
          a[i+2]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=5;
        }
        else i+=1;
      }

      else if((i+9)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd /dd/dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9]) && esNumero(a[i+10]) && esFin(a[i+11])==1){ 
        // dd /dd/dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd /dd/ dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+5])==1 && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // dd /dd/ dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+10)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1  && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd /dd /dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1  && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // dd /dd /dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){ 
        // dd /dd / dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+9, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+6]='|';
          a[i+8]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+13)<n && esNumero(a[i+5])==1 && a[i+6]==' ' && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esNumero(a[i+12])==1 && esFin(a[i+13])==1){
        // dd /dd / dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1 && evaluarAnio(i+9, a, 4)==1){
          traducirMes(i+4, a, 2, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+6]='|';
          a[i+8]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=13;
        }
        else i+=1;
      }
      else if((i+6)<n && esNumero(a[i+5])==1 && esFin(a[i+6])==1){ 
        // dd /dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+4, a, 2)==1){
          traducirMes(i+4, a, 2, m);
          a[i+3]='_';
          a[i+2]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+4]=='0')
            a[i+4]='|';
          i+=6;
        }
        else i+=1;
      }
      else i+=1;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    else if((i+5)<n && esNumero(a[i])==1 && esNumero(a[i+1])==1 && a[i+2]==' ' && esSeparador(a[i+3])==1 && a[i+4]==' ' && esNumero(a[i+5])==1){
      if((i+9)<n && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esFin(a[i+9])==1){ 
        // dd / d/dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 1)==1 && evaluarAnio(i+7, a, 2)==1){
          traducirMes(i+5, a, 1, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+4]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=9;
        }
        else i+=1;
      }
      else if((i+11)<n && esSeparador(a[i+6])==1 && esNumero(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9]) && esNumero(a[i+10]) && esFin(a[i+11])==1){ 
        // dd / d/dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 1)==1 && evaluarAnio(i+7, a, 4)==1){
          traducirMes(i+5, a, 1, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+4]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+10)<n && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd / d/ dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 1)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+5, a, 1, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esSeparador(a[i+6])==1 && a[i+7]==' ' && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // dd / d/ dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 1)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+5, a, 1, m);
          a[i+3]='_';
          a[i+6]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+10)<n && a[i+6]==' ' && esSeparador(a[i+7])==1  && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd / d /dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 1)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+5, a, 1, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && a[i+6]==' ' && esSeparador(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){
        // dd / d /dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 1)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+5, a, 1, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+6]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+11)<n && a[i+6]==' ' && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){ 
        // dd / d / dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 1)==1 && evaluarAnio(i+9, a, 2)==1){
          traducirMes(i+5, a, 1, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+6]='|';
          a[i+8]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+13)<n && a[i+6]==' ' && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esNumero(a[i+12])==1 && esFin(a[i+13])==1){
        // dd / d / dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 1)==1 && evaluarAnio(i+9, a, 4)==1){
          traducirMes(i+5, a, 1, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+6]='|';
          a[i+8]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=13;
        }
        else i+=1;
      }
      else if((i+6)<n && esFin(a[i+6])==1){ 
        // dd / d
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 1)==1){
          traducirMes(i+5, a, 1, m);
          a[i+3]='_';
          a[i+2]='|';
          a[i+4]='|';
          if(a[i]=='0')
            a[i]='|';
          i+=6;
        }
        else i+=1;
      }

      else if((i+10)<n && esNumero(a[i+6])==1 && esSeparador(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esFin(a[i+10])==1){ 
        // dd / dd/dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 2)==1 && evaluarAnio(i+8, a, 2)==1){
          traducirMes(i+5, a, 2, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+4]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+5]=='0')
            a[i+5]='|';
          i+=10;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+6])==1 && esSeparador(a[i+7])==1 && esNumero(a[i+8])==1 && esNumero(a[i+9])==1 && esNumero(a[i+10]) && esNumero(a[i+11]) && esFin(a[i+12])==1){ 
        // dd / dd/dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 2)==1 && evaluarAnio(i+8, a, 4)==1){
          traducirMes(i+5, a, 2, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+4]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+5]=='0')
            a[i+5]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+6])==1 && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){ 
        // dd / dd/ dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 2)==1 && evaluarAnio(i+9, a, 2)==1){
          traducirMes(i+5, a, 2, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+8]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+5]=='0')
            a[i+5]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+13)<n && esNumero(a[i+6])==1 && esSeparador(a[i+7])==1 && a[i+8]==' ' && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esNumero(a[i+12])==1 && esFin(a[i+13])==1){
        // dd / dd/ dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 2)==1 && evaluarAnio(i+9, a, 4)==1){
          traducirMes(i+5, a, 2, m);
          a[i+3]='_';
          a[i+7]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+8]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+5]=='0')
            a[i+5]='|';
          i+=13;
        }
        else i+=1;
      }
      else if((i+11)<n && esNumero(a[i+6])==1 && a[i+7]==' ' && esSeparador(a[i+8])==1  && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esFin(a[i+11])==1){ 
        // dd / dd /dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 2)==1 && evaluarAnio(i+9, a, 2)==1){
          traducirMes(i+5, a, 2, m);
          a[i+3]='_';
          a[i+8]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+5]=='0')
            a[i+5]='|';
          i+=11;
        }
        else i+=1;
      }
      else if((i+13)<n && esNumero(a[i+6])==1 && a[i+7]==' ' && esSeparador(a[i+8])==1  && esNumero(a[i+9])==1 && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esNumero(a[i+12])==1 && esFin(a[i+13])==1){
        // dd / dd /dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 2)==1 && evaluarAnio(i+9, a, 4)==1){
          traducirMes(i+5, a, 2, m);
          a[i+3]='_';
          a[i+8]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+7]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+5]=='0')
            a[i+5]='|';
          i+=13;
        }
        else i+=1;
      }
      else if((i+12)<n && esNumero(a[i+6])==1 && a[i+7]==' ' && esSeparador(a[i+8])==1 && a[i+9]==' ' && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esFin(a[i+12])==1){ 
        // dd / dd / dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 2)==1 && evaluarAnio(i+10, a, 2)==1){
          traducirMes(i+5, a, 2, m);
          a[i+3]='_';
          a[i+8]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+7]='|';
          a[i+9]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+5]=='0')
            a[i+5]='|';
          i+=12;
        }
        else i+=1;
      }
      else if((i+14)<n && esNumero(a[i+6])==1 && a[i+7]==' ' && esSeparador(a[i+8])==1 && a[i+9]==' ' && esNumero(a[i+10])==1 && esNumero(a[i+11])==1 && esNumero(a[i+12])==1 && esNumero(a[i+13])==1 && esFin(a[i+14])==1){
        // dd / dd / dddd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 2)==1 && evaluarAnio(i+10, a, 4)==1){
          traducirMes(i+5, a, 2, m);
          a[i+3]='_';
          a[i+8]='_';
          a[i+2]='|';
          a[i+4]='|';
          a[i+7]='|';
          a[i+9]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+5]=='0')
            a[i+5]='|';
          i+=14;
        }
        else i+=1;
      }
      else if((i+7)<n && esNumero(a[i+6])==1 && esFin(a[i+7])==1){ 
        // dd / dd
        if(evaluarDia(i, a, 2)==1 && evaluarMes(i+5, a, 2)==1){
          traducirMes(i+5, a, 2, m);
          a[i+3]='_';
          a[i+2]='|';
          a[i+4]='|';
          if(a[i]=='0')
            a[i]='|';
          if(a[i+5]=='0')
            a[i+5]='|';
          i+=7;
        }
        else i+=1;
      }
      else i+=1;
    }
    else i+=1;
  }
}

void escribirArchivo(char *arch, int n, char a[], char m[]){
  FILE *archivo;
  archivo = fopen(arch,"w");
  int i = 0;
  for (i; i<n; i++){
    if(a[i]=='~')
      fprintf(archivo, "%s", "enero");
    else if(a[i]=='{')
      fprintf(archivo, "%s", "febrero");
    else if(a[i]=='}')
      fprintf(archivo, "%s", "marzo");
    else if(a[i]=='[')
      fprintf(archivo, "%s", "abril");
    else if(a[i]==']')
      fprintf(archivo, "%s", "mayo");
    else if(a[i]=='#')
      fprintf(archivo, "%s", "junio");
    else if(a[i]=='$')
      fprintf(archivo, "%s", "julio");
    else if(a[i]=='%')
      fprintf(archivo, "%s", "agosto");
    else if(a[i]=='&')
      fprintf(archivo, "%s", "septiembre");
    else if(a[i]=='<')
      fprintf(archivo, "%s", "octubre");
    else if(a[i]=='>')
      fprintf(archivo, "%s", "noviembre");
    else if(a[i]=='*')
      fprintf(archivo, "%s", "diciembre");
    else if(a[i]=='_')
      fprintf(archivo, "%s", " de ");
    else if(a[i]=='|')
      fprintf(archivo, "%s", "");
    else if(a[i]==EOF)
      fprintf(archivo, "%s", "");
    else
      fprintf(archivo, "%c", a[i]);
  }
  fclose(archivo);
}

int main(int argc, char *argv[]){

  if(checkparameters(argc)==0)
    exit(0);

  else{
    if(validarArchivo(argv[1]) != 1){
      printf("Error: El archivo de entrada no existe");
      return 0;
    }

    else{
      int n = contarCaracteres(argv[1]);
      char a[n];
      leerArchivo(argv[1], n, a);
    
      char m[]={'~','{','}','[',']','#','$','%','&','<','>','*'};
      //       ene feb mar abr may jun jul ago sep oct nov div
      // _ = ' de '
      // | = vacio
      traducir(n, a, m);
      escribirArchivo(argv[2], n, a, m);
    }
  }
  return 0;
}
