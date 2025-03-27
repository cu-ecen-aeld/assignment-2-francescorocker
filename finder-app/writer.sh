#!/bin/bash

usage() {
  echo "Uso: $0 <writefile> <writestr>"
  echo "  <writefile>  : percorso completo al file (incluso il nome del file) dove scrivere il contenuto"
  echo "  <writestr>   : stringa di testo da scrivere nel file"
  exit 1
}

if [ $# -ne 2 ]; then
  usage
fi

writefile=$1
writestr=$2

dirpath=$(dirname "$writefile")

if [ ! -d "$dirpath" ]; then
  echo "directory $dirpath non exist.."
  mkdir -p "$dirpath"
  if [ $? -ne 0 ]; then
    echo "Error: cannot create directory $dirpath"
    exit 1
  fi
fi

echo "$writestr" > "$writefile"

if [ $? -eq 0 ]; then
  echo "File $writefile create."
else
  echo "Error: cannot write in $writefile"
  exit 1
fi
