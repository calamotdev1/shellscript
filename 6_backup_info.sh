#!/bin/bash

# Ejercicio 6: Captura Dinámica y Sustitución
# Objetivo: Guardar el resultado de un comando en una variable

# Captura la fecha actual usando sustitución de comandos
FECHA=$(date +%Y-%m-%d)

# Captura la cantidad de archivos en HOME
ARCHIVOS=$(ls $HOME | wc -l)

# Imprime el mensaje con las variables capturadas
echo "Hoy es $FECHA y tienes $ARCHIVOS archivos en tu HOME"
