%{
    open Lexer
%}

(* token definitions *)
%token <int> INT 
%token PLUS MINUS TIMES DIV LPAREN RPAREN EOF

%start program 
%type <int> program

%%

program:
| expr EOF { $1 }
;

expr:
  | INT { $1 }
  | expr PLUS expr { $1 + $3 }
  | expr MINUS expr { $1 - $3 }
  | expr TIMES expr { $1 * $3 }
  | expr DIV expr { $1 / $3 }
  | LPAREN expr RPAREN { $2 }
  ;

%%

let parse str =
  let lexbuf = Lexing.from_string str in
  let result = Parser.program Lexer.token lexbuf in
  result