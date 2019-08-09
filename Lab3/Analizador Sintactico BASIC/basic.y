%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <math.h>
  extern int yylex(void);
  extern char *yytext;
  extern FILE *yyin;
  void yyerror(char *s);
%}

%token AND OR CLOSE DATA DIM END GOTO GOSUB IF THEN INPUT OUTPUT LET STEP NEXT OPEN FOR AS POKE PRINT READ RETURN RESTORE RUN STOP SYS WAIT NOT TO REMARK ENTERO REAL IDENTIFICADOR STRING NO_IGUAL MENOR_IGUAL MAYOR_IGUAL SALTO

%start Program

%%

Program : Lines {printf("\nAn\240lisis Exitoso \n");}

Lines         : ENTERO Statements SALTO Lines 
                | ENTERO Statements SALTO
                ;

Statements    : Statement ':' Statements
                | Statement
                ;

Statement     : CLOSE '#' ENTERO 
                | DATA Constant_List 
                | DIM IDENTIFICADOR '(' Integer_List ')'
                | END          
                | FOR IDENTIFICADOR '=' Expression TO Expression     
                | FOR IDENTIFICADOR '=' Expression TO Expression STEP ENTERO      
                | GOTO Expression 
                | GOSUB Expression 
                | IF Expression THEN Statement         
                | INPUT ID_List       
                | INPUT '#' ENTERO ',' ID_List       
                | LET IDENTIFICADOR '=' Expression 
                | NEXT ID_List               
                | OPEN Value FOR Access AS '#' ENTERO
                | POKE Value_List
                | PRINT Print_List
                | PRINT '#' ENTERO ',' Print_List
                | READ ID_List           
                | RETURN
                | RESTORE
                | RUN
                | STOP
                | SYS Value
                | WAIT Value_List
                | REMARK
                ;

Access     : INPUT
             | OUTPUT
             ;
                   
ID_List    : IDENTIFICADOR ',' ID_List 
             | IDENTIFICADOR 
             ;

Value_List        : Value ',' Value_List 
                    | Value 
                    ;

Constant_List     : Constant ',' Constant_List 
                    | Constant 
                    ;

Integer_List      : ENTERO ',' Integer_List
                    | ENTERO 
                    ;
                 
Expression_List   : Expression ',' Expression_List 
                    | Expression 
                    ;

Print_List        : Expression ';' Print_List
                    | Expression 
                    ;

Expression    : And_Exp OR Expression 
                | And_Exp 
                ;

And_Exp       : Not_Exp AND And_Exp 
                | Not_Exp 
                ;
 
Not_Exp       : NOT Compare_Exp 
                | Compare_Exp 
                ;

Compare_Exp   : Add_Exp '='  Compare_Exp 
                | Add_Exp NO_IGUAL Compare_Exp 
                | Add_Exp '>'  Compare_Exp 
                | Add_Exp MAYOR_IGUAL Compare_Exp 
                | Add_Exp '<'  Compare_Exp 
                | Add_Exp MENOR_IGUAL Compare_Exp 
                | Add_Exp 
                ;

Add_Exp       : Mult_Exp '+' Add_Exp 
                | Mult_Exp '-' Add_Exp 
                | Mult_Exp 
                ;

Mult_Exp      : Negate_Exp '*' Mult_Exp 
                | Negate_Exp '/' Mult_Exp 
                | Negate_Exp 
                ;

Negate_Exp    : '-' Power_Exp 
                | Power_Exp 
                ;

Power_Exp     : Power_Exp '^' Value 
                | Value 
                ;

Value         : '(' Expression ')'
                | IDENTIFICADOR 
                | IDENTIFICADOR '(' Expression_List ')'
                | Constant 
                ;

Constant   : ENTERO 
             | STRING 
             | REAL 
             ;
