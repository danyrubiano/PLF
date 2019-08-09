%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

%}

ID [A-Z]([0-9]|("$"|"%"))?
ENTERO [0-9]+
REAL [0-9]*\.[0-9]+
STRING \"(\\.|[^"])*\"
ESPACIO (" "|"\t")

%%

"<>" {fputs("<>", yyout);}
"==" {fputs("==", yyout);}
"<=" {fputs("<=", yyout);}
">=" {fputs(">=", yyout);}
"/=" {fputs("/=", yyout);}
"=" {fputs("=", yyout);}
"<" {fputs("<", yyout);}
">" {fputs(">", yyout);}
"+" {fputs("+", yyout);}
"-" {fputs("-", yyout);}
"*" {fputs("*", yyout);}
"/" {fputs("/", yyout);}
"^" {fputs("^", yyout);}
"(" {fputs("(", yyout);}
")" {fputs(")", yyout);}


"AND"  {fputs("AND", yyout);}
"OR"  {fputs("OR", yyout);}

"CLOSE"  {fputs("CLOSE", yyout);}
"DATA"  {fputs("DATA", yyout);}
"DIM"  {fputs("DIM", yyout);}
"END"  {fputs("END", yyout);}
"FOR"  {fputs("FOR", yyout);}
"GOTO"  {fputs("GOTO", yyout);}
"GOSUB"  {fputs("GOSUB", yyout);}
"IF"  {fputs("IF", yyout);}
"THEN"  {fputs("THEN", yyout);}
"INPUT"  {fputs("INPUT", yyout);}
"OUTPUT"  {fputs("OUTPUT", yyout);}
"LET"  {fputs("LET", yyout);}
"STEP"  {fputs("STEP", yyout);}
"NEXT"  {fputs("NEXT", yyout);}
"OPEN"  {fputs("OPEN", yyout);}
"FOR"  {fputs("FOR", yyout);}
"AS"  {fputs("AS", yyout);}
"POKE"  {fputs("POKE", yyout);}
"PRINT"  {fputs("PRINT", yyout);}
"READ"  {fputs("READ", yyout);}
"RETURN"  {fputs("RETURN", yyout);}
"RESTORE"  {fputs("RESTORE", yyout);}
"RUN"  {fputs("RUN", yyout);}
"STOP"  {fputs("STOP", yyout);}
"SYS"  {fputs("SYS", yyout);}
"WAIT"  {fputs("WAIT", yyout);}
"NOT"  {fputs("NOT", yyout);}
"TO"  {fputs("TO", yyout);}


"REM"{ESPACIO}.*  {fputs("REMARK", yyout);}

^{ENTERO}{ESPACIO}  {fputs("NUMERO_LINEA ", yyout);}

{ENTERO}  {fputs("ENTERO", yyout);}
{REAL}  {fputs("REAL", yyout);}
{STRING}  {fputs("STRING", yyout);}

{ID} {fputs("IDENTIFICADOR", yyout);}

%%

int main(int argc, char *argv[]){
        if(argc == 1){
		printf("Error: Faltan par\240metros en la l\241nea de comandos.\n");
		printf("Uso: lexico.exe archivo_entrada archivo_salida");
		return 0;
	}
	else if(argc == 2){
		printf("Error: Falta par\240metro en la l\241nea de comandos.\n");
		printf("Uso: lexico.exe archivo_entrada archivo_salida");
		return 0;
	}
	else if(argc > 3){
		printf("Error: Demasiados par\240metros en la l\241nea de comandos.\n");
		printf("Uso: lexico.exe archivo_entrada archivo_salida");
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