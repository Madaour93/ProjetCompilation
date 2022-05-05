%{
    open AST
%}
%token<float> NOMBRE
%token  PLUS MOINS FOIS GPAREN DPAREN  MODULO PT_VIRG EOL
%left PLUS MOINS
%left FOIS MODULO
%nonassoc UMOINS
%type <AST.expression_a> main expression
%start main
%%
main:
expression EOL { $1 }
;
expression:
expression PLUS expression { Plus ($1,$3) }
| expression MOINS expression { Moins($1,$3) }
| expression FOIS expression { Mult ($1,$3) }
| expression MODULO expression {Mod ($1,$3) }
| GPAREN expression DPAREN { $2 }
| MOINS expression %prec UMOINS { Neg $2 }
| NOMBRE { Num $1 }
;