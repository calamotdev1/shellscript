#!/bin/bash

# Ejercicio 7: El Calculador de Argumentos
# Objetivo: Trabajar con parámetros posicionales ($1, $2, etc.)

# Guardar los argumentos en variables
N1=$1
N2=$2

# Calcular la suma usando aritmética en Bash
SUMA=$((N1 + N2))

# Mostrar el nombre del script usando $0
echo "Script ejecutado: $0"

# Mostrar cuántos argumentos se recibieron
echo "Total de argumentos recibidos: $#"

# Mostrar los números y la suma
echo "Número 1: $N1"
echo "Número 2: $N2"
echo "La suma de $N1 + $N2 = $SUMA"
