%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>


char* funcionRetornames(char b,char a){

  char *mes;
  if(a=='x'){
    if(b=='1'){
    mes="enero";
  }
  if(b=='2'){
    mes="febrero";
  }

  if(b=='3'){
    mes="marzo";
  }

  if(b=='4'){
    mes="abril";
  }

  if(b=='5'){
    mes="mayo";
  }

  if(b=='6'){
    mes="junio";
  }

  if(b=='7'){
    mes="julio";
  }

  if(b=='8'){
    mes="agosto";
  }
  if(b=='9'){
    mes="septiembre";
  }  
  }
  if(b=='0'){
  if(a=='1'){
    mes="enero";
  }
  if(a=='2'){
    mes="febrero";
  }

  if(a=='3'){
    mes="marzo";
  }

  if(a=='4'){
    mes="abril";
  }

  if(a=='5'){
    mes="mayo";
  }

  if(a=='6'){
    mes="junio";
  }

  if(a=='7'){
    mes="julio";
  }

  if(a=='8'){
    mes="agosto";
  }
  if(a=='9'){
    mes="septiembre";
  }
  }
  if(b=='1'){
    if(a=='0'){
        mes="octubre";
  }
    if(a=='1'){
      mes="noviembre";
  }

    if(a=='2'){
      mes="diciembre";
  }
    
    }
  return mes;

}

void agregar(char p,char a[]){
  if(a[0]!='x'&&a[1]=='x'){
    a[1]=p;
  }
  if(a[0]=='x'){
    a[0]=p;
  }
   

}
void agregar2(char p,char a[]){
   if(a[0]!='x'&&a[1]!='x'&&a[2]!='x'&&a[3]=='x'){
    a[3]=p;
  }
    if(a[0]!='x'&&a[1]!='x'&&a[2]=='x'){
    a[2]=p;
  }
    if(a[0]!='x'&&a[1]=='x'){
    a[1]=p;
  }
 
  if(a[0]=='x'){
    a[0]=p;
  }
 
  
}

char* traduceAnoDos(char a,char b){
	char *num1;
	 char *num2;
	 char *nuevo;
	 char *viejo;
	nuevo="20";
	viejo="19";
	if(a=='1'){num1="1";}
	if(a=='2'){num1="2";}
	if(a=='3'){num1="3";}
	if(a=='4'){num1="4";}
	if(a=='5'){num1="5";}
	if(a=='6'){num1="6";}
	if(a=='7'){num1="7";}
	if(a=='8'){num1="8";}
	if(a=='9'){num1="9";}
	if(a=='0'){num1="0";}

	if(b=='1'){num2="1";}
	if(b=='2'){num2="2";}
	if(b=='3'){num2="3";}
	if(b=='4'){num2="4";}
	if(b=='5'){num2="5";}
	if(b=='6'){num2="6";}
	if(b=='7'){num2="7";}
	if(b=='8'){num2="8";}
	if(b=='9'){num2="9";}
	if(b=='0'){num2="0";}
	char* str3 = (char *) malloc(1 + strlen(num1) + strlen(num2) + strlen(nuevo)+ strlen(viejo) );

	if((a=='1'||a=='0') && (b<='6')){
		strcpy(str3,nuevo);
		strcat(str3,num1);
		strcat(str3,num2);
	}else{
		strcpy(str3,viejo);
		strcat(str3,num1);
		strcat(str3,num2);
		
	}
	return str3;
}

void wut(char todo[],int largo, int yes){
  char dia[2] ={ 'x', 'x' };
  char mes[2] ={ 'x', 'x' };
  char ano[4] ={ 'x', 'x', 'x', 'x'};

  int i,corrobora;
  corrobora=1;
  i=0;
  int contador;
  contador=0;
  while(i<largo){
    if(todo[i]=='/' | todo[i]=='-'){
      contador++;
      corrobora=0;
    }
    if(todo[i]==' '){
      
      corrobora=0;
    }
    if(contador==0&& corrobora==1){
      agregar(todo[i],dia);
    }
    if(contador==1&& corrobora==1){
      agregar(todo[i],mes);
    }
    if(contador==2&& corrobora==1){
      agregar2(todo[i],ano);
    }
    i++;
    corrobora=1;
  }
	if(yes==1){ 	fputc(todo[0],yyout);
}  
 	
  char *meso;
  meso=NULL;
  char *year;
  year=NULL;
  meso=funcionRetornames(mes[0],mes[1]);
  if(dia[1]=='x'){
      fputc(dia[0],yyout);
  }else{
  	if(dia[0]=='0'){fputc(dia[1],yyout);}else{
  	 	fputc(dia[0],yyout);
  	fputc(dia[1],yyout);} }
 fputs(" de ",yyout);
 fputs(meso,yyout);

 if(ano[1]!='x'){
   fputs(" de ",yyout);
 if(ano[3]=='x'){
 	year =traduceAnoDos(ano[0],ano[1]);

 	fputs(year,yyout);
 } else{
;
      fputc(ano[0],yyout);
      fputc(ano[1],yyout);
      fputc(ano[2],yyout);
      fputc(ano[3],yyout);
 }
    }
  fputc(todo[largo-1],yyout);

 
}


%}

NUMERO1 [0-9]
NUMERO2 [1-9]
MES[1-9]
MES1[0-2]
ESPACIO[' ']
DEL['/'|-]
UNO['1']
CERO['0']
DIA1[1-2]
TRES['3']
INICIO [a-zA-Z]
FIN[ \n | ' ' ]


%%  


{FIN}({CERO}{NUMERO2}|{DIA1}{NUMERO1}|{TRES}{CERO}|{TRES}{UNO}|{NUMERO2}){ESPACIO}?{DEL}{ESPACIO}?({MES}|{CERO}{NUMERO2}|{UNO}{MES1}){ESPACIO}?{DEL}{ESPACIO}?({UNO}{NUMERO1}{NUMERO1}{NUMERO1}{FIN}|{NUMERO1}{NUMERO1}{FIN})    {wut(yytext,yyleng,1);}
^({CERO}{NUMERO2}|{DIA1}{NUMERO1}|{TRES}{CERO}|{TRES}{UNO}|{NUMERO2}){ESPACIO}?{DEL}{ESPACIO}?({MES}|{CERO}{NUMERO2}|{UNO}{MES1}){ESPACIO}?{DEL}{ESPACIO}?({UNO}{NUMERO1}{NUMERO1}{NUMERO1}{FIN}|{NUMERO1}{NUMERO1}{FIN})    {wut(yytext,yyleng,0);}
{FIN}({CERO}{NUMERO2}|{DIA1}{NUMERO1}|{TRES}{CERO}|{TRES}{UNO}|{NUMERO2}){ESPACIO}?{DEL}{ESPACIO}?({MES}|{CERO}{NUMERO2}|{UNO}{MES1}){FIN}    {wut(yytext,yyleng,1);}
^({CERO}{NUMERO2}|{DIA1}{NUMERO1}|{TRES}{CERO}|{TRES}{UNO}|{NUMERO2}){ESPACIO}?{DEL}{ESPACIO}?({MES}|{CERO}{NUMERO2}|{UNO}{MES1}){FIN}    {wut(yytext,yyleng,0);}

%%


int main(int argc, char *argv[]){

    if(argc == 1){
		printf("Error: Faltan par\240metros en la l\241nea de comandos.\n");
		printf("Uso: analizador.exe archivo_entrada archivo_salida");
		return 0;
	}
	else if(argc == 2){
		printf("Error: Falta par\240metro en la l\241nea de comandos.\n");
		printf("Uso: analizador.exe archivo_entrada archivo_salida");
		return 0;
	}
	else if(argc > 3){
		printf("Error: Demasiados par\240metros en la l\241nea de comandos.\n");
		printf("Uso: analizador.exe archivo_entrada archivo_salida");
		return 0;
	}

    else{
		yyin = fopen(argv[1],"r");
		if(yyin == NULL)
			printf("Error: El archivo de entrada no existe.\n");
		else{
			yyout = fopen(argv[2], "w");
			yylex();
			fclose(yyin);
			fclose(yyout);
		}
    }	
	
	return 0;
}