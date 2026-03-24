#!/bin/bash

# Ejercicio 9: El Validador de Root
# Objetivo: Usar condicionales if para verificar el entorno

# Verificar si el usuario es root (EUID = 0)
if [ $EUID -eq 0 ]; then
    # El usuario es root
    echo "Tienes superpoderes para administrar Debian"
else
    # El usuario no es root
    echo "Eres un usuario mortal. Usa sudo para tareas administrativas"
fi
