#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

#get element
if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
#get element using number as argument
elif [[ $1 =~ ^[0-9]+$ ]]
then
  TABLA_ELEMENTS=$($PSQL"SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1;")
  if [[ -z $TABLA_ELEMENTS ]]
  then
  echo "I could not find that element in the database."
  else    
    echo "$TABLA_ELEMENTS" | while read TYPE_ID BAR ATOMIC_NUM BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    
    
    done
  fi
#get element using Symbol as argument
elif [[  ${#1} -le 2 ]]
  then 
  TABLA_ELEMENTS=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1';")
  if [[ -z $TABLA_ELEMENTS ]]
  then
  echo "I could not find that element in the database."
  else    
    echo "$TABLA_ELEMENTS" | while read TYPE_ID BAR ATOMIC_NUM BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
else
TABLA_ELEMENTS=$($PSQL"SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1';")
  if [[ -z $TABLA_ELEMENTS ]]
  then
  echo "I could not find that element in the database."
  else    
    echo "$TABLA_ELEMENTS" | while read TYPE_ID BAR ATOMIC_NUM BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi


