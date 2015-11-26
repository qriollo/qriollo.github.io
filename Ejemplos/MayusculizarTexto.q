enchufar Chamuyo

OJO. Funciona solamente para letras en ASCII.
el mayusculizar_letra de Letra en Letra
  dada l da numerito_a_letra (letra_a_numerito l & ~32)

el mayusculizar_texto de Texto en Texto
  dado "" da ""  OJO. Caso vacío
  dado (Texto (letra : letras))
    da Texto (mayusculizar_letra letra : letras)

