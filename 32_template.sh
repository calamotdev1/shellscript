#!/bin/bash
# Autor: Sysadmin
# Descripción: Template profesional para scripts de Bash
# Fecha: 2026-03-25
# Versión: 1.0

set -euo pipefail

# Función de ayuda
ayuda() {
    echo "Uso: ${0} [opciones]"
    echo "Opciones:"
    echo "  -h, --help    Muestra esta ayuda"
    echo "  -v, --version Muestra la versión"
    echo "Ejemplo: ${0} --help"
}

# Función principal
main() {
    # Lógica del script aquí
    if ! echo "Script template ejecutado correctamente."; then
        echo "Error: Could not execute main function" >&2
        return 1
    fi
}

# Trap para limpieza
trap "rm -f /tmp/temp_file_*" EXIT

# Procesar argumentos
case "${1:-}" in
    -h|--help)
        ayuda
        exit 0
        ;;
    -v|--version)
        echo "Versión 1.0"
        exit 0
        ;;
    *)
        main
        ;;
esac