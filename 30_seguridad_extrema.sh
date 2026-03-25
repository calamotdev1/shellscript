#!/bin/bash

set -e
set -u

echo "Script con seguridad extrema iniciado."

# Intentar ls en una carpeta que no existe
ls /carpeta_que_no_existe

echo "Esto no se debería imprimir si ls falla."

# Intentar usar una variable no definida
echo "Valor de variable inventada: $VARIABLE_INVENTADA"

echo "Fin del script."