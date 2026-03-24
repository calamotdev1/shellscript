#!/bin/bash

################################################################################
# Descripción: [Describe aquí el propósito del script]
#
# Autor: [Tu nombre]
# Fecha: $(date +%d/%m/%Y)
# Versión: 1.0
################################################################################

# Configuración de opciones
set -euo pipefail  # exit on error, undefined variables, pipe failures

################################################################################
# VARIABLES GLOBALES
################################################################################

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_NAME="$(basename "$0")"
readonly LOG_FILE="${SCRIPT_DIR}/log.txt"

################################################################################
# FUNCIONES
################################################################################

# Función para mostrar información
info() {
    echo "[INFO] $*" | tee -a "$LOG_FILE"
}

# Función para mostrar advertencias
warn() {
    echo "[WARN] $*" >&2 | tee -a "$LOG_FILE"
}

# Función para mostrar errores
error() {
    echo "[ERROR] $*" >&2 | tee -a "$LOG_FILE"
}

# Función para mostrar el uso del script
usage() {
    cat << EOF
Uso: $SCRIPT_NAME [opciones]

Opciones:
    -h, --help      Muestra esta ayuda
    -v, --verbose   Modo verbose
    -c, --config    Archivo de configuración

Ejemplos:
    $SCRIPT_NAME
    $SCRIPT_NAME -v
EOF
}

# Función para validar requisitos
check_requirements() {
    local required_cmd
    required_cmd=("bash" "grep" "sed")
    
    for cmd in "${required_cmd[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            error "El comando requerido '$cmd' no está instalado"
            return 1
        fi
    done
    
    info "Todos los requisitos están cumplidos"
}

# Función para limpiar recursos
cleanup() {
    info "Limpiando recursos..."
    # Agregar aquí las operaciones de limpieza necesarias
}

# Configurar trap para limpiar al salir
trap cleanup EXIT

################################################################################
# LÓGICA PRINCIPAL
################################################################################

main() {
    info "Iniciando $SCRIPT_NAME"
    
    # Validar requisitos
    check_requirements || exit 1
    
    # Procesar argumentos
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                usage
                exit 0
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -c|--config)
                CONFIG_FILE="$2"
                shift 2
                ;;
            *)
                error "Opción desconocida: $1"
                usage
                exit 1
                ;;
        esac
    done
    
    # Agregar lógica principal aquí
    info "Script completado exitosamente"
}

################################################################################
# EJECUCIÓN
################################################################################

# Ejecutar main solo si el script no está siendo sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
