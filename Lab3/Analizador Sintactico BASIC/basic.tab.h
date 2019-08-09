
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     AND = 258,
     OR = 259,
     CLOSE = 260,
     DATA = 261,
     DIM = 262,
     END = 263,
     GOTO = 264,
     GOSUB = 265,
     IF = 266,
     THEN = 267,
     INPUT = 268,
     OUTPUT = 269,
     LET = 270,
     STEP = 271,
     NEXT = 272,
     OPEN = 273,
     FOR = 274,
     AS = 275,
     POKE = 276,
     PRINT = 277,
     READ = 278,
     RETURN = 279,
     RESTORE = 280,
     RUN = 281,
     STOP = 282,
     SYS = 283,
     WAIT = 284,
     NOT = 285,
     TO = 286,
     REMARK = 287,
     ENTERO = 288,
     REAL = 289,
     IDENTIFICADOR = 290,
     STRING = 291,
     NO_IGUAL = 292,
     IGUAL = 293,
     MENOR_IGUAL = 294,
     MAYOR_IGUAL = 295,
     SALTO = 296
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


