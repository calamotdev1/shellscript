#!/bin/bash

# Ejercicio 5: El Informador del Sistema
# Objetivo: Declarar variables de usuario y usar variables de entorno

# Variable propia del usuario
CURSO="Shell Scripting"

# Imprime el mensaje de bienvenida usando variable de entorno $USER y variable propia $CURSO
echo "Hola $USER, bienvenido al curso $CURSO"

# Muestra el directorio actual usando $PWD
echo "Tu directorio actual es: $PWD"

# Muestra la terminal predeterminada usando $SHELL
echo "Tu terminal predeterminada es: $SHELL"
