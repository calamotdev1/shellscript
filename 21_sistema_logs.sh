#!/bin/bash

escribir_log() {
    local mensaje=$1
    echo "[$(date)] - $mensaje"
}

escribir_log "Inicio"
escribir_log "Procesando"
escribir_log "Fin"