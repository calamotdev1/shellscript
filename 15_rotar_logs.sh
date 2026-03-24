#!/bin/bash

# Script: rotar_logs.sh
# Objetivo: Gestionar el tamaño de archivos de log usando redirección y truncado

# Definir el archivo de log de prueba
archivo_log="/home/sysadmin/Desktop/ejercicios/falso_log.log"

echo "=== Rotador y Limpiador de Logs ==="
echo ""

# Crear archivo de prueba si no existe
if [ ! -f "$archivo_log" ]; then
    echo "Creando archivo de prueba: $archivo_log"
    # Agregar contenido de prueba
    cat > "$archivo_log" << 'EOF'
[2024-03-24 10:00:00] Iniciando servicio
[2024-03-24 10:00:01] Cargando configuración
[2024-03-24 10:00:02] Conectando a base de datos
[2024-03-24 10:00:03] Iniciando servidor web
[2024-03-24 10:00:04] Escuchando en puerto 80
EOF
    echo "✓ Archivo de prueba creado"
    echo ""
fi

# Obtener el tamaño del archivo en bytes
tamano=$(stat -c%s "$archivo_log")
tamano_kb=$((tamano / 1024))

echo "Analizando archivo: $archivo_log"
echo "Tamaño actual: $tamano bytes ($tamano_kb KB)"
echo ""

# Verificar si el archivo pesa más de 1KB (1024 bytes)
if [ "$tamano" -gt 1024 ]; then
    echo "⚠ El archivo pesa más de 1KB. Truncando archivo..."
    echo ""
    
    # Truncar el archivo (vaciarlo) usando redirección
    > "$archivo_log"
    
    echo "✓ Archivo truncado exitosamente"
    nuevo_tamano=$(stat -c%s "$archivo_log")
    echo "Nuevo tamaño: $nuevo_tamano bytes"
else
    echo "✓ El archivo pesa menos de 1KB. Agregando entrada..."
    echo ""
    
    # Agregar una línea con la fecha actual al final del archivo
    echo "Chequeo realizado el $(date '+%Y-%m-%d %H:%M:%S')" >> "$archivo_log"
    
    echo "✓ Entrada agregada exitosamente"
    nuevo_tamano=$(stat -c%s "$archivo_log")
    echo "Nuevo tamaño: $nuevo_tamano bytes"
fi

echo ""
echo "=== Contenido final del archivo ==="
echo ""
cat "$archivo_log"
echo ""
echo "✓ Proceso completado."
