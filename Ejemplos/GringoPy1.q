enchufar Chamuyo

gringo Py "open(${1}, 'r')"
          abrir_para_lectura de Texto en Pendorcho

gringo Py "${1}.read(1)"
          leer_una_letra de Pendorcho en Letra

gringo Py "${1}.close()"
          cerrar_archivo de Pendorcho en ()

el programa es
  escupirm (leer_una_letra archivo);
  cerrar_archivo archivo
donde
  el archivo es abrir_para_lectura "a.txt"
boludo
