#!/bin/bash

# Script: setup_web.sh
# Objetivo: Generar archivo de configuración Apache usando Here-Doc (EOF)

# Solicitar nombre de dominio al usuario
echo "=== Configurador Automático de VirtualHost ==="
echo ""
echo -n "Ingresa el nombre de dominio (ej: misitio.com): "
read dominio

# Validar que no esté vacío
if [ -z "$dominio" ]; then
    echo "Error: El nombre de dominio no puede estar vacío."
    exit 1
fi

# Archivo de destino
archivo_vhost="/tmp/vhost.conf"

echo ""
echo "Creando archivo de configuración: $archivo_vhost"
echo ""

# Crear el archivo con Here-Doc (EOF)
cat <<EOF > "$archivo_vhost"
<VirtualHost *:80>
    ServerName $dominio
    DocumentRoot /var/www/$dominio
    ErrorLog /var/log/apache2/error.log
</VirtualHost>
EOF

# Confirmar creación del archivo
if [ -f "$archivo_vhost" ]; then
    echo "✓ Archivo creado exitosamente."
    echo ""
    echo "=== Contenido del archivo: $archivo_vhost ==="
    echo ""
    cat "$archivo_vhost"
    echo ""
    echo "✓ Archivo listo para ser utilizado."
else
    echo "✗ Error al crear el archivo."
    exit 1
fi
