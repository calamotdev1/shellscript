#!/bin/bash

touch /tmp/script.lock

trap "rm /tmp/script.lock; exit" SIGINT SIGTERM EXIT

echo "Proceso crítico iniciado. Archivo de bloqueo creado en /tmp/script.lock"

count=0
while [ $count -lt 5 ]; do
    echo "Procesando... $count"
    sleep 1
    count=$((count + 1))
done

echo "Proceso completado."