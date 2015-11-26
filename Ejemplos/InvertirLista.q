
enchufar Chamuyo

el invertir
  dada []       da [] 
  dada (x : xs) da agregar_al_final x (invertir xs)

el agregar_al_final
  dados x []     da [x]
  dados x (y:ys) da y : agregar_al_final x ys

