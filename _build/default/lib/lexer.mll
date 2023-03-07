(* define helper regexes *)
let digit = ['0'-'9']
let integer = digit+

(* define rule token *)
rule token = parse
    | integer {Parser.INT (int_of_String Lexing.lexeme) }
    | "+" {Parser.PLUS}
    | "-" {Parser.MINUS}
    | "*" {Parser.TIMES}
    | "/" {Parser.DIV}
    | "(" {Parser.LPAREN}
    | ")" {Parser.RPAREN}
    | eof {Parser.EOF}    
    | _ {failwith "Unknown token"}
