
enchufar Chamuyo

un Árbol de tipoNodo tipoHoja es
  bien Hoja tipoHoja
  bien Nodo tipoNodo
            (Árbol de tipoNodo tipoHoja)
            (Árbol de tipoNodo tipoHoja)

la suma_de_los_nodos
  dada (Hoja n)         da n
  dado (Nodo n izq der) da
    n + suma_de_los_nodos izq
      + suma_de_los_nodos der

