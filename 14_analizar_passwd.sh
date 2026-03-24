#!/bin/bash

# Script: analizar_passwd.sh
# Objetivo: Leer y procesar el archivo /etc/passwd línea a línea

echo "=== Análisis de Usuarios del Sistema ==="
echo ""
echo "Mostrando los primeros 10 usuarios y sus shells:"
echo ""

# Contador para limitar a 10 líneas
contador=0

# Leer línea a línea el archivo /etc/passwd
while IFS=: read -r user x uid gid desc home shell; do
    # Incrementar contador
    ((contador++))
    
    # Procesar solo las primeras 10 líneas
    if [ $contador -le 10 ]; then
        echo "Usuario: $user - Shell: $shell"
    else
        break
    fi
done < /etc/passwd

echo ""
echo "✓ Procesadas $contador líneas del archivo /etc/passwd"
