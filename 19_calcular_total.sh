#!/bin/bash

# Script to calculate total inventory using awk
total=$(awk '{sum += $2} END {print sum}' ventas.txt)
echo "El inventario total es de $total unidades"