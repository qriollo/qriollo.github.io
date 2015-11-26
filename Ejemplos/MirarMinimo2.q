enchufar Chamuyo

el mínimo
  dada [] da
    escupir "La lista vacía no tiene mínimo.\n";
    espichar 1
  dada [x] da x
  dada (x : y : xs)
    si x < y da mínimo (x : xs)
    si no    da mínimo (y : xs)

