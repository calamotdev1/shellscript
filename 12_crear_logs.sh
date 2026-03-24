#!/bin/bash

# Script: crear_logs.sh
# Objetivo: Generar múltiples archivos de log usando bucle for

# Definir la carpeta temporal para los logs
CARPETA_LOGS="/tmp/logs_ejercicio"

# Solicitar al usuario un número
echo "=== Generador de Logs de Prueba ==="
echo ""
echo -n "¿Cuántos archivos de log deseas crear? (número entero): "
read numero

# Validar que sea un número
if ! [[ "$numero" =~ ^[0-9]+$ ]]; then
    echo "Error: Debes proporcionar un número entero válido."
    exit 1
fi

# Validar que sea mayor a 0
if [ "$numero" -le 0 ]; then
    echo "Error: El número debe ser mayor a 0."
    exit 1
fi

# Crear la carpeta temporal si no existe
if [ ! -d "$CARPETA_LOGS" ]; then
    mkdir -p "$CARPETA_LOGS"
    echo "Carpeta creada: $CARPETA_LOGS"
fi

# Limpiar archivos antiguos (opcional)
rm -f "$CARPETA_LOGS"/log_*.txt 2>/dev/null

echo ""
echo "Creando $numero archivos de log..."
echo ""

# Bucle for para crear los archivos
for i in $(seq 1 $numero); do
    archivo="$CARPETA_LOGS/log_$i.txt"
    touch "$archivo"
    echo "✓ Creado: $archivo"
done

echo ""
echo "=== Archivos creados en $CARPETA_LOGS ==="
echo ""
ls -lh "$CARPETA_LOGS"/log_*.txt

echo ""
echo "Total de archivos: $(ls -1 $CARPETA_LOGS/log_*.txt 2>/dev/null | wc -l)"
echo ""
echo "✓ Proceso completado exitosamente."
