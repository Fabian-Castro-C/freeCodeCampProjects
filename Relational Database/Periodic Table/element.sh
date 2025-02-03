#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Verifica si se pasó un argumento
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

ELEMENT_INFO=$($PSQL "
  SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
  FROM elements 
  INNER JOIN properties USING(atomic_number) 
  INNER JOIN types USING(type_id) 
  WHERE atomic_number::TEXT = '$1' OR symbol ILIKE '$1' OR name ILIKE '$1';
")


if [[ -z $ELEMENT_INFO ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

# Extraer valores
IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING <<< "$ELEMENT_INFO"

# Imprimir información en el formato requerido
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
