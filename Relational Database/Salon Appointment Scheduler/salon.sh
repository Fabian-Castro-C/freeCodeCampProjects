#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  # Si hay un error, se muestra
  if [[ $1 ]]
  then
    echo -e "$1"
  fi

  # Obtener y mostrar los servicios
  echo -e "Welcome to My Salon, how can I help you?\n"
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Leer el ID del servicio que selecciona el usuario
  read SERVICE_ID_SELECTED

  # Validar si la entrada es un número
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # Volver al menú si no es válido
    MAIN_MENU "\nInvalid option. Please enter a valid service number."
  else
    # Verificar si el servicio existe
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_NAME ]]
    then
      # Volver al menú si el servicio no existe
      MAIN_MENU "\nI could not find that service. What would you like today?"
    else
      # Continuar con el flujo si el servicio es válido
      GET_CUSTOMER_INFO "$SERVICE_NAME"
    fi
  fi
}

GET_CUSTOMER_INFO() {
  # Obtener el número de teléfono del cliente
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # Buscar al cliente en la base de datos
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # Si el cliente no existe
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # Insertar el cliente en la tabla de clientes
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  # Continuar con la cita
  SCHEDULE_APPOINTMENT "$CUSTOMER_NAME" "$1"
}

SCHEDULE_APPOINTMENT() {
  CUSTOMER_NAME=$1
  SERVICE_NAME=$2

  # Pedir la hora de la cita
  echo -e "\nWhat time would you like your $(echo "$SERVICE_NAME" | tr '[:upper:]' '[:lower:]'), $CUSTOMER_NAME?"
  read SERVICE_TIME

  # Insertar la cita en la tabla de citas
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Confirmar la cita
  echo -e "\nI have put you down for a $(echo "$SERVICE_NAME" | tr '[:upper:]' '[:lower:]') at $SERVICE_TIME, $CUSTOMER_NAME."
}

# Iniciar el menú principal
MAIN_MENU
