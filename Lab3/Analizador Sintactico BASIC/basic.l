%option noyywrap
%option yylineno

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "basic.tab.h"

%}

ID [A-Z]([0-9]|("$"|"%"))?
ENTERO [0-9]+
REAL [0-9]*\.[0-9]+
STRING \"(\\.|[^"])*\"
ESPACIO (" "|"\t")
SALTO("\n")

%%
"<>" {return(NO_IGUAL);}
"<=" {return(MENOR_IGUAL);}
">=" {return(MAYOR_IGUAL);}
"=" {return('=');}
"<" {return('<');}
">" {return('>');}
"+" {return('+');}
"-" {return('-');}
"*" {return('*');}
"/" {return('/');}
"^" {return('^');}
"(" {return('(');}
")" {return(')');}
"#" {return('#');}
"," {return(',');}
";" {return(';');}


"AND"  {return(AND);}
"OR"  {return(OR);}

"CLOSE"  {return(CLOSE);}
"DATA"  {return(DATA);}
"DIM"  {return(DIM);}
"END"  {return(END);}
"FOR"  {return(FOR);}
"GOTO"  {return(GOTO);}
"GOSUB"  {return(GOSUB);}
"IF"  {return(IF);}
"THEN"  {return(THEN);}
"INPUT"  {return(INPUT);}
"OUTPUT"  {return(OUTPUT);}
"LET"  {return(LET);}
"STEP"  {return(STEP);}
"NEXT"  {return(NEXT);}
"OPEN"  {return(OPEN);}
"FOR"  {return(FOR);}
"AS"  {return(AS);}
"POKE"  {return(POKE);}
"PRINT"  {return(PRINT);}
"READ"  {return(READ);}
"RETURN"  {return(RETURN);}
"RESTORE"  {return(RESTORE);}
"RUN"  {return(RUN);}
"STOP"  {return(STOP);}
"SYS"  {return(SYS);}
"WAIT"  {return(WAIT);}
"NOT"  {return(NOT);}
"TO"  {return(TO);}


"REM"{ESPACIO}.*  {return(REMARK);}


{ENTERO}  {return(ENTERO);}
{REAL}  {return(REAL);}
{STRING}  {return(STRING);}

{ID} {return(IDENTIFICADOR);}

{SALTO} {return(SALTO);}

%%

void yyerror(char *s)
{
  printf("\nError sint\240ctico en l\241nea %d. \n",yylineno);
}

int main(int argc, char *argv[]){
    
    if(argc == 1){
		printf("Error: Faltan par\240metros en la l\241nea de comandos.\n");
		printf("Uso: basic.exe archivo_entrada");
		return 0;
	}
	else if(argc > 2){
		printf("Error: Demasiados par\240metros en la l\241nea de comandos.\n");
		printf("Uso: basic.exe archivo_entrada");
		return 0;
	}

    else{
		yyin = fopen(argv[1],"r");
		if(yyin == NULL)
			printf("Error: El archivo de entrada no existe.\n");
		else{
			yyparse();
			fclose(yyin);
		}
    }	
	
	return 0;
}