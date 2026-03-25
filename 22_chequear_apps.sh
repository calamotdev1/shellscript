#!/bin/bash

esta_instalado() {
    if dpkg -l $1 2>/dev/null | grep -q "^ii"; then
        return 0
    else
        return 1
    fi
}

if esta_instalado "curl"; then
    echo "El paquete curl está listo"
else
    echo "Debes instalar curl"
fi