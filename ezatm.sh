#!/bin/zsh

# Define the path to Python script
SCRIPT_DIR="$HOME/ezatm"
# Import .zshrc to make atm function available
source $HOME/.zshrc

#echo "Hello World"
#echo "TENANT: $1"
#echo "ENVIRONMENT: $2"
#echo "SCRIPT_NAME_CODE: $3"
# Check if two parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 FULL_DOMAIN SCRIPT_TYPE"
    echo "Example: $0 tenant1.can1dev.alayacare.ca mysql"
    echo "SCRIPT_TYPE should be 'mysql', 'clinical' or 'ff'"
    exit 1
fi

# Assign parameters to variables
FULL_DOMAIN=$1
SCRIPT_TYPE=$2

# Extract tenant and environment from the full domain
# Check if domain format includes environment (e.g., tenant1.can1dev.alayacare.ca)
# or without environment (e.g., auscare.alayacare.ca)
if [[ "$FULL_DOMAIN" == *".alayacare."* ]]; then
    # If domain contains .alayacare., it's prod environment
    TENANT=$(echo $FULL_DOMAIN | cut -d'.' -f1)
    ENVIRONMENT="prod"
    ATM_DOMAIN=$FULL_DOMAIN
else
    # Non-prod environment, extract tenant and environment from full domain
    TENANT=$(echo $FULL_DOMAIN | cut -d'.' -f1)
    ENVIRONMENT=$(echo $FULL_DOMAIN | cut -d'.' -f2)
    ATM_DOMAIN=$FULL_DOMAIN
fi

case $SCRIPT_TYPE in
    mysql|clinical)
        SCRIPT_NAME="get_db_credentials.py"
        ;;
    ff)
        SCRIPT_NAME="get_ff_credentials.py"
        ;;
    *)
        echo "Invalid SCRIPT_TYPE provided: $SCRIPT_TYPE"
        echo "SCRIPT_TYPE should be 'mysql', 'clinical' or 'ff'"
        exit 2
        ;;
esac

# excute the command
if [ "$SCRIPT_TYPE" = "ff" ]; then
    atm get v1/tenant/${ATM_DOMAIN} | python3 ${SCRIPT_DIR}/$SCRIPT_NAME ${TENANT} ${ENVIRONMENT}
else
    atm get v1/tenant/${ATM_DOMAIN} | python3 ${SCRIPT_DIR}/$SCRIPT_NAME ${TENANT} ${ENVIRONMENT} ${SCRIPT_TYPE}
fi
