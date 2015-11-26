
enchufar Chamuyo

chirimbolo zurdo 10 <*>

cualidad Monoide para coso
  el neutro de coso
  el <*>    de coso en coso en coso
boludo

OJO. Varios envoltorios para que los numeritos provean
OJO. distintas operaciones.
un NumeritoMax es bien NumeritoMax Numerito
un NumeritoMin es bien NumeritoMin Numerito
un NumeritoSum es bien NumeritoSum Numerito
un NumeritoMul es bien NumeritoMul Numerito

el desNumeritoMax dado (NumeritoMax n) da n
el desNumeritoMin dado (NumeritoMin n) da n
el desNumeritoSum dado (NumeritoSum n) da n
el desNumeritoMul dado (NumeritoMul n) da n

encarnar Monoide para NumeritoMax
  el neutro es NumeritoMax 0#
  el <*> dados (NumeritoMax x) (NumeritoMax y)
            si x > y da NumeritoMax x
            si no    da NumeritoMax y
boludo

encarnar Monoide para NumeritoMin
  el neutro es NumeritoMin 4294967295#
  el <*> dados (NumeritoMin x) (NumeritoMin y)
            si x < y da NumeritoMin x
            si no    da NumeritoMin y
boludo

encarnar Monoide para NumeritoSum
  el neutro es NumeritoSum 0#
  el <*> dados (NumeritoSum x) (NumeritoSum y)
            da NumeritoSum (x + y)
boludo

encarnar Monoide para NumeritoMul
  el neutro es NumeritoMul 1#
  el <*> dados (NumeritoMul x) (NumeritoMul y)
            da NumeritoMul (x * y)
boludo

el colapsar de [m] en m
           con Monoide para m
  es plegard (el <*>) neutro

el testNumeritos es
  [
    desNumeritoMax . colapsar . fap NumeritoMax $ lista,
    desNumeritoMin . colapsar . fap NumeritoMin $ lista,
    desNumeritoSum . colapsar . fap NumeritoSum $ lista,
    desNumeritoMul . colapsar . fap NumeritoMul $ lista
  ]
donde
  la lista es [2#, 1#, 3#, 4#, 5#]
boludo

