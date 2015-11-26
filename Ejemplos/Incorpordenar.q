enchufar Chamuyo

el incorpordenar
  dada []  da []
  dada [x] da [x]
  dada lista da
    ponele que
      el tamaño       es longitud lista
      la mitá         es tamaño / 2
      la primera_mitá es agarrar mitá lista
      la segunda_mitá es tirar mitá lista
    en
      incorporar (incorpordenar primera_mitá)
                 (incorpordenar segunda_mitá)

el incorporar
  dadas []       ys da ys
  dadas (x : xs) [] da (x : xs)
  dadas (x : xs) (y : ys)
    si x < y da x : incorporar xs (y : ys)
    si no    da y : incorporar (x : xs) ys

la longitud
  dada []     da 0#
  dada (_:xs) da 1# + longitud xs

el agarrar
  dados 0# _      da []
  dados n  []     da []
  dados n  (x:xs) da x : agarrar (n - 1) xs

el tirar
  dados 0# xs     da xs
  dados _  []     da []
  dados n  (_:xs) da tirar (n - 1) xs

el programa es
  escupir . mostrar . incorpordenar $
    [70#, 78#, 24#, 47#, 63#, 36#, 5#,
     96#, 54#, 86#, 30#, 95#, 0#, 25#,
     18#, 18#, 73#, 96#, 1#, 1#]

