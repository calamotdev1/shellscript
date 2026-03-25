#!/bin/bash

# Script: buscar_errores.sh
# Objetivo: Buscar y contar errores en un archivo de log usando grep

# Definir archivo de log (usando /var/log/syslog o crear uno de prueba)
archivo_log="/home/sysadmin/Desktop/ejercicios/test_log.log"

echo "=== Detective de Errores ==="
echo ""

# Crear archivo de log de prueba si no existe
if [ ! -f "$archivo_log" ]; then
    echo "Creando archivo de log de prueba: $archivo_log"
    cat > "$archivo_log" << 'EOF'
2026-03-24 10:00:01 INFO Sistema iniciado correctamente
2026-03-24 10:00:02 WARNING Memoria disponible baja
2026-03-24 10:00:03 ERROR No se puede conectar a la base de datos
2026-03-24 10:00:04 INFO Intentando reconexión
2026-03-24 10:00:05 ERROR Timeout en la conexión
2026-03-24 10:00:06 INFO Base de datos conectada
2026-03-24 10:00:07 WARNING Uso de CPU elevado
2026-03-24 10:00:08 error Permiso denegado en archivo config
2026-03-24 10:00:09 INFO Archivo reconfigurado
2026-03-24 10:00:10 ERROR Error crítico en el módulo de validación
2026-03-24 10:00:11 INFO Sistema estable
2026-03-24 10:00:12 ERROR Error de acceso a recursos
EOF
    echo "✓ Archivo de prueba creado"
    echo ""
fi

# Mostrar archivo siendo analizado
echo "Analizando archivo: $archivo_log"
echo ""

# Buscar errores (case-insensitive) y mostrar con números de línea
echo "=== Líneas con errores encontradas ==="
echo ""
grep -i -n "error" "$archivo_log"

echo ""

# Contar total de ocurrencias de "error"
total_errores=$(grep -i -c "error" "$archivo_log")

# Mostrar resumen
echo "=== Resumen ==="
echo ""
echo "Se han encontrado $total_errores errores en el archivo."
echo ""
