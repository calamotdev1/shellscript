#!/bin/bash

# Script to clean and extract columns from a list
# Reads from lista.txt, replaces commas with newlines, converts to uppercase, saves to lista_final.txt

tr ',' '\n' < lista.txt | tr 'a-z' 'A-Z' > lista_final.txt