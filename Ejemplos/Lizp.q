enchufar Chamuyo

SI (+C)
  GRINGO C "#include <readline/readline.h>"

  gringo C "readline(${1})"
    _leer_línea de Texto en Pendorcho "char *"

  gringo C "${1}"
    _convertir  de Pendorcho "char *" en Texto

  gringo C "free(${1})"
    _liberar    de Pendorcho "char *" en ()

  el leer_línea de Texto en Texto dado prompt da
    ponele que
      el pendorcho es _leer_línea prompt
      el texto     es _convertir pendorcho
    en _liberar pendorcho; texto
BOLUDO

SI (+Py)
  gringo Py "raw_input(${1})"
    leer_línea de Texto en Texto
BOLUDO

OJO. Lee líneas hasta que la concatenación
OJO. de todas ellas tenga los paréntesis
OJO. balanceados.
el leer_sexpr de () en Texto
  dado () da ciclo "" 0#
  donde

    el ciclo dados acc p da
      ponele que
        la línea es leer_línea (prompt p)
        el p2    es paréntesis_pendientes p línea
      en
        si p2 > 0# da ciclo (acc ++ " " ++ línea) p2
        si no      da acc ++ " " ++ línea

    el prompt dado p
      si p > 0# da "..... "
      si no     da "Lizp> "

    los paréntesis_pendientes de Numerito
                              en Texto
                              en Numerito
      dados p (Texto xs) da rec p xs
      donde
        el rec de Numerito en [Letra] en Numerito
          dados p [] da p
          dados p ('(' : xs) da rec (p + 1#) xs 
          dados p (')' : xs) da rec (p - 1#) xs
          dados p (_   : xs) da rec p xs
      boludo
  boludo

una Sexpr es
  bien Átomo Texto
  bien Cons (Ref de Sexpr) (Ref de Sexpr)

OJO. Read.

el entre de Letra en Letra en Letra en Posta
  dados x y z da
    letra_a_numerito x <= letra_a_numerito y &&
    letra_a_numerito y <= letra_a_numerito z

el constituyente de Letra en Posta
  dada letra da
    entre 'a' letra 'z' ||
    entre 'A' letra 'Z' ||
    entre '0' letra '9' ||
    entre '-' letra '-' ||
    entre '?' letra '?' ||
    entre '!' letra '!'

el leer_átomo de [Letra] en ([Letra], [Letra])
  dada [] da ([], [])
  dada (x : xs)
    si constituyente x
      da mirar leer_átomo xs
           si (átomo, cola) da (x : átomo, cola)
         boludo
    si no da ([], (x : xs))

el leer_lista de [Letra] en ([Sexpr], [Letra])
  dada [] da escupir "final temprano de la entrada\n";
             espichar 1
  dada (' ' : xs)  da leer_lista xs
  dada ('\t' : xs) da leer_lista xs
  dada ('\r' : xs) da leer_lista xs
  dada ('\n' : xs) da leer_lista xs
  dada (')' : xs) da ([], xs)
  dada (x : xs)   da
    mirar leer1 (x : xs)
      si (sexpr, cola) da
        mirar leer_lista cola
          si (lista, cola2) da
            (sexpr : lista, cola2)
        boludo
    boludo

el leer1 de [Letra] en (Sexpr, [Letra])
  dada [] da escupir "final temprano de la entrada\n";
             espichar 1
  dada (' ' : xs)  da leer1 xs
  dada ('\t' : xs) da leer1 xs
  dada ('\r' : xs) da leer1 xs
  dada ('\n' : xs) da leer1 xs
  dada ('(' : xs) da
    mirar leer_lista xs
      si (lista, cola) da
        (plegard cons nil lista, cola)
    boludo
  dada (x : xs)
    si constituyente x da
      mirar leer_átomo (x : xs)
        si (átomo, cola) da (Átomo $ Texto átomo, cola)
      boludo
    si no da
      escupir "entrada deforme\n";
      espichar 1

el leer de Texto en Sexpr
  dado (Texto xs) da
    mirar leer1 xs
      si (sexpr, _) da sexpr
    boludo

OJO. Eval.

el letras_iguales de [Letra] en [Letra] en Posta
  dados []       []       da Sí
  dados []       (_ : _)  da No
  dados (_ : _)  []       da No
  dados (x : xs) (y : ys) da
    letra_a_numerito x == letra_a_numerito y &&
    letras_iguales xs ys

el texto_igual de Texto en Texto en Posta
  dados (Texto a) (Texto b) da letras_iguales a b

el buscar de Sexpr en Sexpr en Sexpr
  dados (Cons (Ref (Cons (Ref k) (Ref v))) (Ref e)) a
     si eq k a da v
     si no     da buscar e a
  dados _ a da a

el reemplazar de Sexpr en Sexpr en Sexpr en ()
  dados (Cons (Ref (Cons (Ref k) ref_v)) (Ref e)) a v
     si eq k a da ref_v := v
     si no     da reemplazar e a v
  dados _ _ _ da 
    escupir "variable indefinida\n";
    espichar 1

el t de Sexpr es Átomo "t"

el nil de Sexpr es Átomo "nil"

el cons de Sexpr en Sexpr en Sexpr
  dados x y da Cons (Ref x) (Ref y)

el atom de Sexpr en Sexpr
  dado (Átomo _) da t
  dado _         da nil

el car de Sexpr en Sexpr
  dado (Átomo a)        da nil
  dado (Cons (Ref x) _) da x

el cdr de Sexpr en Sexpr
  dado (Átomo a)        da nil
  dado (Cons _ (Ref x)) da x

el cadr de Sexpr en Sexpr
  es car . cdr

el cddr de Sexpr en Sexpr
  es cdr . cdr

el eq de Sexpr en Sexpr en Posta
  dados (Átomo a) (Átomo b)
     da texto_igual a b
  dados _ _ da No

el evaluar de Sexpr en Sexpr en Sexpr
  dados entorno (Átomo a)
     da buscar entorno (Átomo a)
  dados entorno (Cons (Ref x) (Ref xs))
     si eq x (Átomo "tal-cual") da
       car xs
     si eq x (Átomo "bloque") da
        evaluar_bloque entorno xs
     si eq x (Átomo "fun") da
       cons (Átomo "#procedimiento")
            (cons entorno xs)
     si eq x (Átomo "si") da
        mirar eq (evaluar entorno (car xs)) nil
          si Sí da evaluar_bloque entorno (cddr xs)
          si No da evaluar entorno (cadr xs)
        boludo
     si eq x (Átomo "guardar!") da
        ponele que
          el valor es evaluar entorno (cadr xs)
        en reemplazar entorno (car xs) valor; valor
     si no da
       aplicar (evaluar entorno x)
               (evaluar_lista entorno (sexpr_lista xs))

el extender de [Sexpr] en [Sexpr] en Sexpr en Sexpr
  dados []       _  entorno da entorno
  dados (p : ps) [] entorno da entorno
  dados (p : ps) (a : as) entorno da
    cons (cons p a) (extender ps as entorno)

el aplicar de Sexpr en [Sexpr] en Sexpr
  dados (Cons
          (Ref (Átomo "#procedimiento"))
          (Ref (Cons (Ref entorno)
                     (Ref (Cons (Ref parámetros)
                                (Ref cuerpo))))))
        argumentos
     da
        evaluar_bloque
          (extender
            (sexpr_lista parámetros)
            argumentos
            entorno)
          cuerpo
  dados (Átomo "#prim:atomo?") [x]       da atom x
  dados (Átomo "#prim:cons")   [x, y]    da cons x y
  dados (Átomo "#prim:car")    [x]       da car x
  dados (Átomo "#prim:cdr")    [x]       da cdr x
  dados (Átomo "#prim:igual?") [x, y]
    si eq x y da t
    si no     da nil
  dados _ _ da nil

el evaluar_bloque de Sexpr en Sexpr en Sexpr
  dados entorno (Átomo a) da Átomo a
  dados entorno
        (Cons
         (Ref (Cons
               (Ref (Átomo "def"))
               (Ref (Cons (Ref nombre)
                     (Ref
                      (Cons (Ref valor)
                       (Ref (Átomo "nil"))))))))
          (Ref xs)) da
    (mirar entorno
     si Cons a r da
       r := cons (cons nombre (evaluar entorno valor))
                 (desref r)
     si no da ()
     boludo);
    evaluar_bloque entorno xs
  dados entorno (Cons (Ref a) (Ref (Átomo _))) da
    evaluar entorno a
  dados entorno (Cons (Ref a) (Ref xs)) da
    evaluar entorno a;
    evaluar_bloque entorno xs

el evaluar_lista de Sexpr en [Sexpr] en [Sexpr]
  dados entorno [] da []
  dados entorno (sexpr : sexprs) da
    evaluar entorno sexpr : evaluar_lista entorno sexprs

el sexpr_lista_1 de Sexpr en ([Sexpr], Quizá de Texto)
  dados sexpr da rec [] sexpr
  donde
    el rec
      dados xs (Átomo "nil") da (xs, Nada)
      dados xs (Átomo a)     da (xs, Este a)
      dados xs (Cons (Ref x) (Ref ys))
         da rec (xs ++ [x]) ys
  boludo

el sexpr_lista de Sexpr en [Sexpr]
  dados sexpr da 
    mirar sexpr_lista_1 sexpr
      si (xs, _) da xs
    boludo

OJO. Print.

el juntar
  dados sep []  da ""
  dados sep [x] da x
  dados sep (x : y : ys)
     da x ++ sep ++ juntar sep (y : ys)

encarnar Mostrable para Sexpr
  el mostrar
    dado (Átomo x)    da x
    dado sexpr da
      mirar sexpr_lista_1 sexpr
        si (xs, Nada) da
          "(" ++ juntar " " (fap mostrar xs) ++ ")"
        si (xs, Este a) da
          "(" ++ juntar " " (fap mostrar xs)
              ++ " . " ++ a ++ ")"
      boludo
boludo

OJO. Read + eval.

el entorno_global es
   cons (cons nil nil) $
   extender [Átomo "atomo?"] [Átomo "#prim:atomo?"] $
   extender [Átomo "cons"]   [Átomo "#prim:cons"] $
   extender [Átomo "car"]    [Átomo "#prim:car"] $
   extender [Átomo "cdr"]    [Átomo "#prim:cdr"] $
   extender [Átomo "igual?"] [Átomo "#prim:igual?"] $
   nil

el read_eval_print_loop dado () da
  ponele que
    la expresión es leer $ leer_sexpr ()
  en
    si eq expresión (Átomo "salir") da ()
    si no da
      escupir .  mostrar .  evaluar entorno_global $
        expresión;
      escupir "\n";
      read_eval_print_loop ()

el programa es
  read_eval_print_loop ()

