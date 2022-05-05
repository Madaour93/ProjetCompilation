# ProjetCompilation
# fragment O.O
un programme avec seulement les expression arithmétique Addition, multiplication, négation et soustration avec le point virgule comme fin de programme.
# fragmant O.1 
les expression avec modulo sont maintenant accepte et les nombres flottant auussi 

# Pour compiler:
ocamllex lexeur.mll
	ocamlyacc parseur.mly
	ocamlc -c AST.ml
	ocamlc -o AST.cmo
	ocamlc -c parseur.mli AST.ml lexeur.ml parseur.ml main.ml
	ocamlc -o main AST.cmo lexeur.cmo parseur.cmo main.cmo