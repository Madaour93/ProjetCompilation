# ProjetCompilation
#fragment O.O
un programme avec seulement les expression arithmétique Addition, multiplication, négation et soustration avec le point virgule comme fin de programme
Pour compiler:
$ ocamllex lexeur.mll
$ ocamlyacc parseur.mly
$ ocamlc -c parseur.mli lexeur.ml parseur.ml main.ml
$ ocamlc -o main lexeur.cmo parseur.cmo main.cmo