(*fichier lexeur.mll *)
{
open Parseur
exception Eof
exception TokenInconu
}
rule token = parse
[' ' '\t''\n'] { token lexbuf }
| "//"(_#'\n')*   { token lexbuf }
| "/*"((_#'*')|('*'+(_#['/' '*'])))*'*'+'/'   { token lexbuf }
| ';' { PT_VIRG }
| ['0'-'9']+('e''-'?['0'-'9']+)? as lexem					{ NOMBRE(float_of_string lexem) }
| (['0'-'9']+'.'['0'-'9']*|['0'-'9']*'.'['0'-'9']+)('e''-'?['0'-'9']+)?	as lexem		{ NOMBRE(float_of_string lexem) }
| "true" | "false" as lexem         {  BOOL(bool_of_string (String.lowercase_ascii lexem)) }
| "=="     { EGAL }
| ">"      { SUP }
| ">="     { SUP }
| "<="      { INF_EGAL }
| '!'       { NON }
| "<>"      { NON_EGAL}
| '<'       { INF }
| "&&"      { AND }
| "||"      { OR }
| '+' { PLUS }
| '-' { MOINS }
| '*' { FOIS }
| '%' { MODULO }
| '(' { GPAREN }
| ')' { DPAREN }
| "NaN"         { NAN }
| (['a'-'z']| ['A'-'Z'])(['a'-'z'] | ['A'-'Z'] | '_' | ['0'-'9'])*  as lexem  { VAR(lexem) }
| '='           { AFFECT }
| eof { raise Eof }
| _ { raise TokenInconu }