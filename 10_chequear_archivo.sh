#!/bin/bash

# Script: chequear_archivo.sh
# Objetivo: Verificar propiedades de un archivo usando operadores de prueba

# Verificar que se proporcionó un argumento
if [ $# -eq 0 ]; then
    echo "Error: Debes proporcionar una ruta como argumento"
    echo "Uso: $0 <ruta>"
    exit 1
fi

ruta="$1"

# Imprimir encabezado
echo "=== Análisis de: $ruta ==="
echo ""

# Verificar si existe (-e)
if [ -e "$ruta" ]; then
    echo "✓ La ruta existe"
    
    # Verificar si es un archivo regular (-f)
    if [ -f "$ruta" ]; then
        echo "✓ Es un archivo regular"
        
        # Verificar si tiene permiso de lectura (-r)
        if [ -r "$ruta" ]; then
            echo "✓ Tienes permiso de lectura"
        else
            echo "✗ No tienes permiso de lectura"
        fi
    # Verificar si es un directorio (-d)
    elif [ -d "$ruta" ]; then
        echo "✓ Es un directorio"
    else
        echo "⚠ Existe pero no es un archivo regular ni un directorio"
    fi
else
    echo "✗ La ruta no existe"
fi

echo ""
echo "=== Fin del análisis ==="
