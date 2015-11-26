enchufar Chamuyo

las alternativas de Ref de [() en coso] son Ref []

el fallar de () en coso
  dado () da
    mirar desref alternativas
    si [] da escupir "NO.\n";
             espichar 1#
    si (alt : alts) da
      alternativas := alts;
      alt ()
    boludo

el elegir de [coso] en coso
  dadas posibilidades da
    ccc (la que dada continuación da
      alternativas :=
        aplistar (la que dadas posibilidad ()
                    da invocar continuación posibilidad)
                 posibilidades ++
        desref alternativas;
      fallar ()
    )

el tripla_pitagórica de Numerito en [Numerito]
  dado n da
    ponele que
      el x es elegir (1#...n)
      el y es elegir (1#...n)
      el z es elegir (1#...n)
    en
      si x * x + y * y == z * z
        da [x, y, z]
      si no da fallar ()

