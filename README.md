Collection des pires tests pour le projet de compil

Les tests sont organisés comme ceux du prof (cf ci-dessous), de sorte que son script fonctionne toujours.
Quand vous ajoutez des fichiers, faites-le au bon endroit et sous la forme (votre nom|votre pseudo|le nom de votre poisson rouge)-testname-number.adb (comme ça on peut vous insulter quand on se rend compte qu'on a pas le bon comportement sur votre test).

Un dossier opt/ contenant la même arborescence que le dossier principal (i.e. un dossier typing/, exec/...) est prévu pour contenir vos tests qui utilisent des fonctionnalités de Ada non présentes en Mini-Ada (commentaires explicatifs obligatoires).


Les tests sont organisés en différentes catégories :

- syntax/bad/    refusés à l'analyse lexicale ou syntaxique
- syntax/good/   acceptés à l'analyse lexicale et syntaxique
- typing/bad/    refusés à l'analyse sémantique
- typing/good/   acceptés à l'analyse sémantique
- exec-fail/     compilés avec succès, mais l'exécution du code x86-64 doit échouer
- exec/          compilés et exécutés avec succès, le résultat attendu étant conforme au fichier .out

Les tests sont cumulatifs i.e.

- les fichiers de typing/bad/, exec-fail/ et exec/ peuvent être
  utilisés pour la catégorie syntax/good/

- les fichiers de exec-fail/ et exec/ peuvent être
  utilisés pour la catégorie typing/good/

