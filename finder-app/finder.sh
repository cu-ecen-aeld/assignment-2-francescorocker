#!/bin/bash

# Funzione per stampare le istruzioni di utilizzo
usage() {
  echo "Uso: $0 <filesdir> <searchstr>"
  echo "  <filesdir>   : directory in filesystem"
  echo "  <searchstr>  : text to find"
  exit 1
}

if [ $# -ne 2 ]; then
  usage
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
  echo "Errore: $filesdir non è una directory valida"
  usage
fi

file_count=0
line_count=0

file_count=$(find "$filesdir" -type f | wc -l)
line_count=$(find "$filesdir" -type f -exec grep -o "$searchstr" {} + | wc -l)

echo "The number of files are $file_count and the number of matching lines are $line_count"
