%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG EOL
%left PLUS MOINS
%left FOIS 
%type <unit> main expression terme facteur
%start main
%%
main:
expression EOL {}
;
expression:
expression PLUS terme {}
| expression MOINS terme {}
| terme {}
;
terme:
terme FOIS facteur {}
| facteur {}
;
facteur:
GPAREN expression DPAREN {}
| MOINS facteur {}
| NOMBRE {}
;