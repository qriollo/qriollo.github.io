enchufar Chamuyo

gringo C "fopen(${1}, \"r\")"
         abrir_para_lectura de Texto en Pendorcho "FILE *"

gringo C "fgetc(${1})"
         leer_una_letra de Pendorcho "FILE *" en Letra

gringo C "fclose(${1})"
         cerrar_archivo de Pendorcho "FILE *" en ()

el programa es
  escupirm (leer_una_letra archivo);
  cerrar_archivo archivo
donde
  el archivo es abrir_para_lectura "a.txt"
boludo
