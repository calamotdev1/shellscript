#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse con privilegios de root."
    exit 1
fi

apt-get update -y
apt-get install -y htop

if [ $? -eq 0 ]; then
    echo "Instalación completada"
else
    echo "Error en la instalación"
fi