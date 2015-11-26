enchufar Chamuyo

chirimbolo zurdo 250 //
chirimbolo zurdo 250 ///

cualidad Iterable para bolsa
  el // de (coso en cosito)
        en bolsa de coso
        en ()
boludo

encarnar Iterable para Quizá
  el //
    dados _ Nada     da ()
    dados f (Este x) da f x; ()
boludo

encarnar Iterable para PRIM.Lista
  el //
    dados _ []       da ()
    dados f (x : xs) da f x; f // xs
boludo

el /// es (el //) . (el //)

OJO. Recolectores.

un Recolector de coso es
  bien Recolector (coso en ()) (() en [coso])

el crear_recolector de () en Recolector de coso
  dado () da Recolector a r
donde
  el resultado es Ref []
  la a dado x  da resultado := desref resultado ++ [x]
  el r dado () da desref resultado
boludo

el acumular de Recolector de coso en coso en ()
  dado (Recolector a _) x da a x

el resultado de Recolector de coso en [coso]
  dado (Recolector _ r) da r ()

el ejemplo de () en [Numerito]
  dado () da
    acumular r /// [ [1#, 2#, 3#], [4#, 5#], [6#] ];
    resultado r
donde
  el r es crear_recolector ()
boludo

