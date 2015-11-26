enchufar Chamuyo

una Valor de coso es
  bien TodavíaNoEvaluada (() en coso)
  bien YaEvaluada coso

una Promesa de coso es
  bien Prometer (Ref de (Valor de coso))

el bancame de (() en coso)
           en Promesa de coso
  dada f
    da Prometer (Ref (TodavíaNoEvaluada f))

el dame de Promesa de coso
        en coso
  dado (Prometer r) da
    mirar desref r
      si TodavíaNoEvaluada f da
        ponele que la x es f () en
          r := YaEvaluada x;
          x
      si YaEvaluada x da x
    boludo

