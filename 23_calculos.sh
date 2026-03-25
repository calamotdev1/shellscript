#!/bin/bash

RESULTADO=0

sumar() {
    local SUMA=$(( $1 + $2 ))
    echo $SUMA
}

sumar 5 3
echo $RESULTADO