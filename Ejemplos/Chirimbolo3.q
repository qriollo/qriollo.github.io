enchufar Chamuyo

OJO. Tienen que terminar con ":" para que sean constructores.
chirimbolo zurdo   10 :+:
chirimbolo prefijo 20 ::

un Árbol de coso es
  bien :: coso
  bien :+: (Árbol de coso) (Árbol de coso)

OJO. Para mostrar árboles.
encarnar Mostrable para Árbol de coso
                    con Mostrable para coso
  el mostrar
    dado (:: x)
      da "::" ++ mostrar x
    dado (x :+: y)
      da "(" ++ mostrar x ++ " :+: " ++ mostrar y ++ ")"
boludo

