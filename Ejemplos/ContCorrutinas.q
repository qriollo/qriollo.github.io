enchufar Chamuyo

el componer_en_paralelo de ((() en ()) en ())
                        en ((() en ()) en ())
                        en ()
  dadas rutina1 rutina2 da resumir1 ()
  donde
    el siguiente1
       de Ref de (Quizá de (Cont de ()))
       es Ref Nada
    el resumir1 de () en ()
    dado () da
      mirar desref siguiente1
      si Nada da
        rutina1 (la que dado () da
          ccc (la que dada continuación da
                 siguiente1 := Este continuación;
                 resumir2 ()))
      si Este continuación da
        invocar continuación ()
      boludo 

    el siguiente2
      de Ref de (Quizá de (Cont de ()))
      es Ref Nada
    el resumir2 de () en ()
    dado () da
      mirar desref siguiente2
      si Nada da
        rutina2 (la que dado () da
          ccc (la que dada continuación da
                 siguiente2 := Este continuación;
                 resumir1 ()))
      si Este continuación da
        invocar continuación ()
      boludo 
  boludo

el ejemplo dado () da
  componer_en_paralelo (rutina "uno\n") (rutina "dos\n")
donde
  la rutina dados texto pasar_el_control da loop ()
  donde
    el loop dado () da
      escupir texto;
      pasar_el_control ();
      loop ()
  boludo
boludo 

