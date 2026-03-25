#!/bin/bash

set -x

a=5
b=10
c=$((a + b))
echo "Suma: $c"

if [ $c -gt 10 ]; then
    echo "La suma es mayor que 10"
fi

set +x

echo "Modo traza desactivado. Fin del script."