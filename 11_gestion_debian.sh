#!/bin/bash

# Script: gestion_debian.sh
# Objetivo: Menú del administrador con estructura case

while true; do
    # Mostrar el menú
    echo ""
    echo "=============================="
    echo "    MENÚ DE ADMINISTRACIÓN"
    echo "=============================="
    echo "1) Actualizar sistema"
    echo "2) Ver espacio en disco"
    echo "3) Salir"
    echo "=============================="
    echo -n "Selecciona una opción: "
    
    # Capturar la opción del usuario
    read opcion
    
    # Procesar la opción con case
    case "$opcion" in
        1)
            echo ""
            echo "Ejecutando: apt update"
            apt update
            echo ""
            ;;
        2)
            echo ""
            echo "Espacio en disco:"
            df -h
            echo ""
            ;;
        3)
            echo ""
            echo "¡Hasta luego, administrador!"
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo "Error: Opción inválida. Por favor, selecciona 1, 2 o 3."
            echo ""
            ;;
    esac
done
