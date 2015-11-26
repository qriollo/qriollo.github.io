
enchufar Chamuyo

el esPrimo
  dado p
    da nadie (esDivisor p) (2..p - 1)

el esDivisor
  dados p d
     da p % d == 0#

los primos
  dado n
    da filtrar esPrimo (2..n)

el programa es
   escupir . mostrar . primos $ 1000#

