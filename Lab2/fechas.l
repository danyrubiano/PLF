%option noyywrap

%{
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
    fputs(m[n-1], yyout);
  }

  int traducirAnio(int n, int largo){
    int aux;
    if(largo == 2){
      if(n>16)
        aux = 1900 + n;
      else
        aux = 2000 + n;
      fprintf(yyout, "%d", aux);
    }
    else if(largo == 4){
      if(n>=1000)
        fprintf(yyout, "%d", n);
    }
  }

%}
DELIM ("/"|"-")
ESPACIO_1 (" ")
ESPACIO_2 (" "|"\t")
NUMERO [0-9]
DIA_0 [1-9]
DIA_1 ([1-2][0-9] | 0[1-9])
OTROS_DELIM ("\n"|" "|"\t")

FECHA_0 ^{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_1 {ESPACIO_2}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_2 ^{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_3 {ESPACIO_2}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_4 ^{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{OTROS_DELIM}
FECHA_5 {ESPACIO_2}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{OTROS_DELIM}

FECHA_6 ^{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_7 {ESPACIO_2}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_8 ^{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_9  {ESPACIO_2}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_10 ^{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_11  {ESPACIO_2}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}

FECHA_12  ^{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_13  {ESPACIO_2}{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_14  ^{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_15  {ESPACIO_2}{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_16  ^{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{OTROS_DELIM}
FECHA_17  {ESPACIO_2}{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{OTROS_DELIM}

FECHA_18  ^{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_19  {ESPACIO_2}{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_20  ^{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_21  {ESPACIO_2}{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_22  ^{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}
FECHA_23  {ESPACIO_2}{NUMERO}{NUMERO}{ESPACIO_1}?{DELIM}{ESPACIO_1}?{NUMERO}{NUMERO}{OTROS_DELIM}


%%

{FECHA_0}  {  if(strlen(yytext)==9){
                // d/d/dddd
                if(evaluarMes(charToInt(yytext[2]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[2]))==1){
                  int aux = unir4Numeros(charToInt(yytext[4]),charToInt(yytext[5]),charToInt(yytext[6]),charToInt(yytext[7]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[2]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[8],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<9; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==10){
                // d/d/ dddd  &&  d/d /dddd
                if(evaluarMes(charToInt(yytext[2]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[2]))==1){
                  int aux = unir4Numeros(charToInt(yytext[5]),charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[2]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[9],yyout);
                } }

                // d/ d/dddd  &&  d /d/dddd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[3]))==1){
                  int aux = unir4Numeros(charToInt(yytext[5]),charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[9],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==11){
                // d/d / dddd
                if(evaluarMes(charToInt(yytext[2]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[2]))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[2]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }

                // d/ d/ dddd  &&  d/ d /dddd  &&  d /d/ dddd  &&  d /d /dddd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[3]))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }

                // d / d/dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // d/ d / dddd  &&  d /d / dddd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[3]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // d / d/ dddd  &&  d / d /dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // d / d / dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_1}  {  
              if(strlen(yytext)==10){
                // d/d/dddd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[3]))==1){
                  int aux = unir4Numeros(charToInt(yytext[5]),charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[9],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==11){
                // d/d/ dddd  &&  d/d /dddd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[3]))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }

                // d/ d/dddd  &&  d /d/dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // d/d / dddd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[3]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // d/ d/ dddd  &&  d/ d /dddd  &&  d /d/ dddd  &&  d /d /dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // d / d/dddd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[5]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // d/ d / dddd  &&  d /d / dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // d / d/ dddd  &&  d / d /dddd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[5]))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==14){
                // d / d / dddd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[5]))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<14; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_2}  {  
              if(strlen(yytext)==7){
                // d/d/dd
                if(evaluarMes(charToInt(yytext[2]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[2]))==1){
                  int aux = unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[2]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[6],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<7; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==8){
                // d/d/ dd  &&  d/d /dd
                if(evaluarMes(charToInt(yytext[2]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[2]))==1){
                  int aux = unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[2]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[7],yyout);
                }

                // d/ d/dd  &&  d /d/dd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[3]))==1){
                  int aux = unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[7],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<8; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==9){
                // d/d / dd
                if(evaluarMes(charToInt(yytext[2]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[2]))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[2]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }

                // d/ d/ dd  &&  d/ d /dd  &&  d /d/ dd  &&  d /d /dd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[3]))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }

                // d / d/dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<9; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==10){
                // d/ d / dd  &&  d /d / dd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[3]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // d / d/ dd  &&  d / d /dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==11){
                // d / d / dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_3}  {  
              if(strlen(yytext)==8){
                // d/d/dd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[3]))==1){
                  int aux = unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[7],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<8; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==9){
                // d/d/ dd  &&  d/d /dd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[3]))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }

                // d/ d/dd  &&  d /d/dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<9; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==10){
                // d/d / dd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[3]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // d/ d/ dd  &&  d/ d /dd  &&  d /d/ dd  &&  d /d /dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // d / d/dd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[5]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==11){
                // d/ d / dd  &&  d /d / dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // d / d/ dd  &&  d / d /dd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[5]))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // d / d / dd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[5]))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_4}  {  if(strlen(yytext)==4){
                // d/d
                if(evaluarMes(charToInt(yytext[2]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[2]))==1){
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[2]),m); fputc(yytext[3],yyout);
                }               
                else{
                  int i = 0;
                  for(i; i<4; i++)
                    fputc(yytext[i],yyout);
              } }
    
              if(strlen(yytext)==5){
                // d/ d  &&  d /d
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[3]))==1){
                  fputc(yytext[0],yyout); fputs(" de ",yyout);  traducirMes(charToInt(yytext[3]),m); fputc(yytext[4],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<5; i++)
                    fputc(yytext[i],yyout);
              } }
              
              if(strlen(yytext)==6){
                // d / d
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[4]))==1){
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputc(yytext[5],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<6; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_5}  {  if(strlen(yytext)==5){
                // d/d
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(charToInt(yytext[1]),charToInt(yytext[3]))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputc(yytext[4],yyout);
                }                
                else{
                  int i = 0;
                  for(i; i<5; i++)
                    fputc(yytext[i],yyout);
              } }
    
              if(strlen(yytext)==6){
                // d/ d  &&  d /d
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[4]))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputc(yytext[5],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<6; i++)
                    fputc(yytext[i],yyout);
              } }

              if(strlen(yytext)==7){
                // d / d
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(charToInt(yytext[0]),charToInt(yytext[5]))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputc(yytext[6],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<7; i++)
                    fputc(yytext[i],yyout);
              } }
            }


{FECHA_6}  {  if(strlen(yytext)==10){
                // d/dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1){
                  int aux = unir4Numeros(charToInt(yytext[5]),charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[9],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==11){
                // d/dd/ dddd  &&  d/dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }

                // d/ dd/dddd  &&  d /dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // d/dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // d/ dd/ dddd  &&  d/ dd /dddd  &&  d /dd/ dddd  &&  d /dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // d / dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // d/ dd / dddd  &&  d /dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // d / dd/ dddd  &&  d / dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==14){
                // d / dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<14; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_7}  {  
              if(strlen(yytext)==11){
                // d/dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==12){
                // d/dd/ dddd  &&  d/dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // d/ dd/dddd  &&  d /dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // d/dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // d/ dd/ dddd  &&  d/ dd /dddd  &&  d /dd/ dddd  &&  d /dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // d / dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==14){
                // d/ dd / dddd  &&  d /dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }

                // d / dd/ dddd  &&  d / dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<14; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==15){
                // d / dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir4Numeros(charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]),charToInt(yytext[13]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[14],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<15; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_8}  {  if(strlen(yytext)==8){
                // d/dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1){
                  int aux = unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])),m);fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[7],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<8; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==9){
                // d/dd/ dd  &&  d/dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }

                // d/ dd/dd  &&  d /dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<9; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==10){
                // d/dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // d/ dd/ dd  &&  d/ dd /dd  &&  d /dd/ dd  &&  d /dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // d / dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==11){
                // d/ dd / dd  &&  d /dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // d / dd/ dd  &&  d / dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // d / dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_9}  {  
              if(strlen(yytext)==9){
                // d/dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<9; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==10){
                // d/dd/ dd  &&  d/dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // d/ dd/dd  &&  d /dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==11){
                // d/dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // d/ dd/ dd  &&  d/ dd /dd  &&  d /dd/ dd  &&  d /dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // d / dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // d/ dd / dd  &&  d /dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }

                // d / dd/ dd  &&  d / dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // d / dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir2Numeros(charToInt(yytext[10]),charToInt(yytext[11]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[12],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
            }


{FECHA_10}  {  if(strlen(yytext)==5){
                // d/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])))==1){
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[2]),charToInt(yytext[3])),m); fputc(yytext[4],yyout);
                }               
                else{
                  int i = 0;
                  for(i; i<5; i++)
                    fputc(yytext[i],yyout);
              } }
    
              if(strlen(yytext)==6){
                // d/ dd  &&  d /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputc(yytext[5],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<6; i++)
                    fputc(yytext[i],yyout);
              } }
              
              if(strlen(yytext)==7){
                // d / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  fputc(yytext[0],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputc(yytext[6],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<7; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_11}  {  if(strlen(yytext)==6){
                // d/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(charToInt(yytext[1]),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputc(yytext[5],yyout);
                }                
                else{
                  int i = 0;
                  for(i; i<6; i++)
                    fputc(yytext[i],yyout);
              } }
    
              if(strlen(yytext)==7){
                // d/ dd  &&  d /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputc(yytext[6],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<7; i++)
                    fputc(yytext[i],yyout);
              } }

              if(strlen(yytext)==8){
                // d / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(charToInt(yytext[0]),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputc(yytext[7],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<8; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_12}  {  if(strlen(yytext)==10){
                // dd/d/dddd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[3]))==1){
                  int aux = unir4Numeros(charToInt(yytext[5]),charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[9],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==11){
                // dd/d/ dddd  &&  dd/d /dddd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[3]))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }

                // dd/ d/dddd  &&  dd /d/dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // dd/d / dddd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[3]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // dd/ d/ dddd  &&  dd/ d /dddd  &&  dd /d/ dddd  &&  dd /d /dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // dd / d/dddd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[5]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // dd/ d / dddd  &&  dd /d / dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // dd / d/ dddd  &&  dd / d /dddd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[5]))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==14){
                // dd / d / dddd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[5]))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<14; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_13}  {  
              if(strlen(yytext)==11){
                // dd/d/dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==12){
                // dd/d/ dddd  &&  dd/d /dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // dd/ d/dddd  &&  dd /d/dddd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[5]))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // dd/d / dddd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[4]))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // dd/ d/ dddd  &&  dd/ d /dddd  &&  dd /d/ dddd  &&  dd /d /dddd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[5]))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // dd / d/dddd
                if(evaluarMes(charToInt(yytext[6]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[6]))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[6]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==14){
                // dd/ d / dddd  &&  dd /d / dddd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[5]))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }

                // dd / d/ dddd  &&  dd / d /dddd
                if(evaluarMes(charToInt(yytext[6]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[6]))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[6]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<14; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==15){
                // dd / d / dddd
                if(evaluarMes(charToInt(yytext[6]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[6]))==1){
                  int aux = unir4Numeros(charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]),charToInt(yytext[13]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[6]),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[14],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<15; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_14}  {  if(strlen(yytext)==8){
                // dd/d/dd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[3]))==1){
                  int aux = unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[7],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<8; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==9){
                // dd/d/ dd  &&  dd/d /dd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[3]))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }

                // dd/ d/dd  &&  dd /d/dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<9; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==10){
                // dd/d / dd
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[3]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // dd/ d/ dd  &&  dd/ d /dd  &&  dd /d/ dd  &&  dd /d /dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // dd / d/dd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[5]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==11){
                // dd/ d / dd  &&  dd /d / dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // dd / d/ dd  &&  dd / d /dd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[5]))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // dd / d / dd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[5]))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_15}  {  
              if(strlen(yytext)==9){
                // dd/d/dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<9; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==10){
                // dd/d/ dd  &&  dd/d /dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // dd/ d/dd  &&  dd /d/dd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[5]))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==11){
                // dd/d / dd
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[4]))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // dd/ d/ dd  &&  dd/ d /dd  &&  dd /d/ dd  &&  dd /d /dd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[5]))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // dd / d/dd
                if(evaluarMes(charToInt(yytext[6]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[6]))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[6]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // dd/ d / dd  &&  dd /d / dd
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[5]))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }

                // dd / d/ dd  &&  dd / d /dd
                if(evaluarMes(charToInt(yytext[6]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[6]))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[6]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // dd / d / dd
                if(evaluarMes(charToInt(yytext[6]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[6]))==1){
                  int aux = unir2Numeros(charToInt(yytext[10]),charToInt(yytext[11]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[6]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[12],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
            }


{FECHA_16}  {  if(strlen(yytext)==5){
                // dd/d
                if(evaluarMes(charToInt(yytext[3]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[3]))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputc(yytext[4],yyout);
                }               
                else{
                  int i = 0;
                  for(i; i<5; i++)
                    fputc(yytext[i],yyout);
              } }
    
              if(strlen(yytext)==6){
                // dd/ d  &&  dd /d
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[4]))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[4]),m); fputc(yytext[5],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<6; i++)
                    fputc(yytext[i],yyout);
              } }
              
              if(strlen(yytext)==7){
                // dd / d
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),charToInt(yytext[5]))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputc(yytext[6],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<7; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_17}  {  if(strlen(yytext)==6){
                // dd/d
                if(evaluarMes(charToInt(yytext[4]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[4]))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[3]),m); fputc(yytext[5],yyout);
                }                
                else{
                  int i = 0;
                  for(i; i<6; i++)
                    fputc(yytext[i],yyout);
              } }
    
              if(strlen(yytext)==7){
                // dd/ d  &&  dd /d
                if(evaluarMes(charToInt(yytext[5]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[5]))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[5]),m); fputc(yytext[6],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<7; i++)
                    fputc(yytext[i],yyout);
              } }

              if(strlen(yytext)==8){
                // dd / d
                if(evaluarMes(charToInt(yytext[6]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[6]))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[6]),m); fputc(yytext[7],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<8; i++)
                    fputc(yytext[i],yyout);
              } }
            }











{FECHA_18}  {  if(strlen(yytext)==11){
                // dd/dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir4Numeros(charToInt(yytext[6]),charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[10],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==12){
                // dd/dd/ dddd  &&  dd/dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }

                // dd/ dd/dddd  &&  dd /dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // dd/dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // dd/ dd/ dddd  &&  dd/ dd /dddd  &&  dd /dd/ dddd  &&  dd /dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // dd / dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==14){
                // dd/ dd / dddd  &&  dd /dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }

                // dd / dd/ dddd  &&  dd / dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<14; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==15){
                // dd / dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir4Numeros(charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]),charToInt(yytext[13]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[14],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<15; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_19}  {  
              if(strlen(yytext)==12){
                // dd/dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[7]),charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[11],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==13){
                // dd/dd/ dddd  &&  dd/dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }

                // dd/ dd/dddd  &&  dd /dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir4Numeros(charToInt(yytext[8]),charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[12],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==14){
                // dd/dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }

                // dd/ dd/ dddd  &&  dd/ dd /dddd  &&  dd /dd/ dddd  &&  dd /dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }

                // dd / dd/dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1){
                  int aux = unir4Numeros(charToInt(yytext[9]),charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[13],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<14; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==15){
                // dd/ dd / dddd  &&  dd /dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir4Numeros(charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]),charToInt(yytext[13]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[14],yyout);
                } }

                // dd / dd/ dddd  &&  dd / dd /dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1){
                  int aux = unir4Numeros(charToInt(yytext[10]),charToInt(yytext[11]),charToInt(yytext[12]),charToInt(yytext[13]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[14],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<15; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==16){
                // dd / dd / dddd
                if(evaluarMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1){
                  int aux = unir4Numeros(charToInt(yytext[11]),charToInt(yytext[12]),charToInt(yytext[13]),charToInt(yytext[14]));
                  if(aux >= 1000){
                    fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])),m); fputs(" de ",yyout); traducirAnio(aux,4); fputc(yytext[15],yyout);
                } }
                else{
                  int i = 0;
                  for(i; i<16; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_20}  {  if(strlen(yytext)==9){
                // dd/dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[8],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<9; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==10){
                // dd/dd/ dd  &&  dd/dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }

                // dd/ dd/dd  &&  dd /dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==11){
                // dd/dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // dd/ dd/ dd  &&  dd/ dd /dd  &&  dd /dd/ dd  &&  dd /dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // dd / dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // dd/ dd / dd  &&  dd /dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }

                // dd / dd/ dd  &&  dd / dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // dd / dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir2Numeros(charToInt(yytext[10]),charToInt(yytext[11]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[12],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_21}  {  
              if(strlen(yytext)==10){
                // dd/dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[7]),charToInt(yytext[8]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[9],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<10; i++)
                    fputc(yytext[i],yyout);
              } }

              else if(strlen(yytext)==11){
                // dd/dd/ dd  &&  dd/dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }

                // dd/ dd/dd  &&  dd /dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir2Numeros(charToInt(yytext[8]),charToInt(yytext[9]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[10],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<11; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==12){
                // dd/dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }

                // dd/ dd/ dd  &&  dd/ dd /dd  &&  dd /dd/ dd  &&  dd /dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }

                // dd / dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1){
                  int aux = unir2Numeros(charToInt(yytext[9]),charToInt(yytext[10]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[11],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<12; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==13){
                // dd/ dd / dd  &&  dd /dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  int aux = unir2Numeros(charToInt(yytext[10]),charToInt(yytext[11]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[12],yyout);
                }

                // dd / dd/ dd  &&  dd / dd /dd
                if(evaluarMes(charToInt(yytext[6]))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),charToInt(yytext[6]))==1){
                  int aux = unir2Numeros(charToInt(yytext[10]),charToInt(yytext[11]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(charToInt(yytext[6]),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[12],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<13; i++)
                    fputc(yytext[i],yyout);
              } }
              
              else if(strlen(yytext)==14){
                // dd / dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1){
                  int aux = unir2Numeros(charToInt(yytext[11]),charToInt(yytext[12]));
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])),m); fputs(" de ",yyout); traducirAnio(aux,2); fputc(yytext[13],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<14; i++)
                    fputc(yytext[i],yyout);
              } }
            }


{FECHA_22}  {  if(strlen(yytext)==6){
                // dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[3]),charToInt(yytext[4])),m); fputc(yytext[5],yyout);
                }               
                else{
                  int i = 0;
                  for(i; i<6; i++)
                    fputc(yytext[i],yyout);
              } }
    
              if(strlen(yytext)==7){
                // dd/ dd  &&  dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputc(yytext[6],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<7; i++)
                    fputc(yytext[i],yyout);
              } }
              
              if(strlen(yytext)==8){
                // dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[0]),charToInt(yytext[1])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputc(yytext[7],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<8; i++)
                    fputc(yytext[i],yyout);
              } }
            }

{FECHA_23}  {  if(strlen(yytext)==7){
                // dd/dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[4]),charToInt(yytext[5])),m); fputc(yytext[6],yyout);
                }                
                else{
                  int i = 0;
                  for(i; i<7; i++)
                    fputc(yytext[i],yyout);
              } }
    
              if(strlen(yytext)==8){
                // dd/ dd  &&  dd /dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[5]),charToInt(yytext[6])),m); fputc(yytext[7],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<8; i++)
                    fputc(yytext[i],yyout);
              } }

              if(strlen(yytext)==9){
                // dd / dd
                if(evaluarMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1 && evaluarDia(unir2Numeros(charToInt(yytext[1]),charToInt(yytext[2])),unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])))==1){
                  fputc(yytext[0],yyout); fputc(yytext[1],yyout); fputc(yytext[2],yyout); fputs(" de ",yyout); traducirMes(unir2Numeros(charToInt(yytext[6]),charToInt(yytext[7])),m); fputc(yytext[8],yyout);
                }
                else{
                  int i = 0;
                  for(i; i<9; i++)
                    fputc(yytext[i],yyout);
              } }
            }

%%

int main(int argc, char *argv[]){
    
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

    else{
      yyin = fopen(argv[1],"r");
      if(yyin == NULL)
        printf("Error: El archivo de entrada no existe.");
      
      else{
        yyout = fopen(argv[2],"w");
        yylex();
        fclose(yyin);
        fclose(yyout);
      }
    } 
  return 0;
}