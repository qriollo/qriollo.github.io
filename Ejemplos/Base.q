enchufar Chamuyo

el en_base
  dados b n
     si n == 0# da []
     si no      da r () ++ [d]
  donde
    el d es n % b
    el r dado _ da en_base b (n / b)
  boludo

