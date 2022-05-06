%{
    open AST
%}

%token <float> NOMBRE
%token <bool> BOOL
%token <string> VAR
%token  EGAL SUP SUP_EGAL INF INF_EGAL NON NON_EGAL NOMBRE NAN OR AND  VAR AFFECT PLUS MOINS FOIS GPAREN DPAREN  MODULO PT_VIRG EOL
%right AFFECT
%left OR
%left AND
%left EGAL INF INF_EGAL
%left PLUS MOINS
%left FOIS MODULO
%nonassoc UMOIN
%nonassoc NON
%type <AST.expression_a> main expression
%start main
%%
main:
expression EOL { $1 }
;
expression:
|VAR AFFECT expression   { Affect($1, $3, (get_size_expression $3) + 2)}
| expression OR expression        { Or($1, $3, (get_size_expression $1) + (get_size_expression $3) + 3 + size_convert_to_bool)}
| expression AND expression        { And($1, $3, (get_size_expression $1) + (get_size_expression $3) + 2 + size_convert_to_bool)}
| expression EGAL expression      { Egal($1, $3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2)}
| expression SUP expression     { Sup($1, $3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2) }
| expression SUP_EGAL expression { Sup_egal($1, $3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2) }
| expression INF expression     { Inf($1, $3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2) }
| expression INF_EGAL expression { Inf_egal($1, $3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2) }
| expression PLUS expression    { Plus($1, $3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2)}
| expression MOINS expression   { Moins($1,$3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2) }
| expression FOIS expression    { Mult($1,$3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2) } 
| expression MODULO expression { Mod ($1,$3,(get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2) }
| GPAREN expression DPAREN { $2 }
| expression MOINS expression   { Moins($1,$3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2) }
| NON expression                { Non ($2, (get_size_expression $2) + 1 + size_convert_to_bool) }
| expression NON_EGAL expression { NotEql($1, $3, (get_size_expression $1) + (get_size_expression $3) + 1 + size_convert_to_num*2) }
| NAN                           { Nan "NaN" }
| NOMBRE { Num $1 }
| BOOL   { Bool $1 }
| VAR    { Var $1 }
;