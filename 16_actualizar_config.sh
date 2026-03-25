#!/bin/bash

# Script: actualizar_config.sh
# Objetivo: Modificar contenido dentro de un archivo usando sed -i

# Definir el archivo de configuración
archivo_config="/home/sysadmin/Desktop/ejercicios/config.env"

echo "=== Editor Quirúrgico de Configuración ==="
echo ""

# Crear archivo config.env si no existe
if [ ! -f "$archivo_config" ]; then
    echo "Creando archivo de configuración: $archivo_config"
    echo "DB_PASSWORD=12345" > "$archivo_config"
    echo "✓ Archivo creado"
    echo ""
fi

# Mostrar contenido actual
echo "=== Configuración actual ==="
cat "$archivo_config"
echo ""

# Obtener la contraseña antigua
contrasena_antigua=$(grep "^DB_PASSWORD=" "$archivo_config" | cut -d'=' -f2)

echo "Contraseña actual: $contrasena_antigua"
echo ""

# Solicitar nueva contraseña al usuario
echo -n "Ingresa la nueva contraseña: "
read contrasena_nueva

# Validar que no esté vacía
if [ -z "$contrasena_nueva" ]; then
    echo "Error: La contraseña no puede estar vacía."
    exit 1
fi

echo ""
echo "Actualizando configuración..."
echo ""

# Usar sed -i para reemplazar la contraseña (in-place editing)
sed -i "s/DB_PASSWORD=$contrasena_antigua/DB_PASSWORD=$contrasena_nueva/" "$archivo_config"

# Verificar que el cambio se hizo
if grep -q "DB_PASSWORD=$contrasena_nueva" "$archivo_config"; then
    echo "✓ Contraseña actualizada exitosamente"
else
    echo "✗ Error al actualizar la contraseña"
    exit 1
fi

echo ""
echo "=== Configuración actualizada ==="
cat "$archivo_config"
echo ""
echo "✓ Proceso completado."
