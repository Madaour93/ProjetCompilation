# ProjetCompilation
# fragment O.O
un programme avec seulement les expression arithmétique Addition, multiplication, négation et soustration avec le point virgule comme fin de programme.
# fragmant O.1 
les expression avec modulo sont maintenant accepte et les nombres flottant auussi 
# fragment 0.2
les opereateur de comparaison true, flase >,>=,<,<=,! et <>(non egal)
# fragment 1.0
on accepte n'iporte quel nombre et le NAN
# fragment 1.1
on peut faire maintenant des commentaire uniligne du genre //ceci est commentaire. et les commentaire multiligne du genre /* ceci est 
un commentaire */

# fragment 1.2

# fragment 1.3 
les opérateur OR et AND sont possible 
# fragment 2.0 
les variables commencent par une lettre minuscule et peuvent être composées de lettres,
chiffres, souligne "_". Les variables sont instanciées via x = expr ; où expr
est n'importe quelle expression
# Pour compiler:
ocamllex lexeur.mll
	ocamlyacc parseur.mly
	ocamlc -c AST.ml
	ocamlc -o AST.cmo
	ocamlc -c parseur.mli AST.ml lexeur.ml parseur.ml main.ml
	ocamlc -o main AST.cmo lexeur.cmo parseur.cmo main.cmo