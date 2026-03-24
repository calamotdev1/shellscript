#!/bin/bash

# Ejercicio 8: Mi Primera Lista (Array)
# Objetivo: Introducción a los arreglos indexados

# Declarar un array con 4 distros
DISTROS=("Debian" "Ubuntu" "Mint" "Kali")

# Añadir una quinta distro al array
DISTROS+=("Arch")

# Imprimir la primera distro de la lista
echo "La primera distro es: ${DISTROS[0]}"

# Imprimir el número total de elementos del array
echo "Total de distros en el array: ${#DISTROS[@]}"

# Mostrar todas las distros para referencia
echo ""
echo "Todas las distros del array:"
for distro in "${DISTROS[@]}"; do
    echo "  - $distro"
done
