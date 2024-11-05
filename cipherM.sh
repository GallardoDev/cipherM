#!/bin/bash

GREEN="\e[32m"
CYAN="\e[36m"
NC="\e[0m"

# Función para el banner
banner() {
    echo -e "${CYAN}"
    echo "==========================================="
    echo "  ██████╗██╗██████╗ ███████╗███████╗███████╗"
    echo " ██╔════╝██║██╔══██╗██╔════╝██╔════╝██╔════╝"
    echo " ██║     ██║██████╔╝█████╗  █████╗  ███████╗"
    echo " ██║     ██║██╔══██╗██╔══╝  ██╔══╝  ╚════██║"
    echo " ╚██████╗██║██║  ██║███████╗███████╗███████║"
    echo "  ╚═════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝"
    echo "  Ethical Hacking Key Encrypter/Decrypter  "
    echo "              GallardoDev                  "
    echo "==========================================="
    echo -e "${NC}"
}

# Función de encriptación
encrypt() {
    read -sp "Introduce el texto a encriptar: " clave
    echo
    read -p "Introduce un nombre para el archivo de salida: " output_file
    echo "$clave" | openssl enc -aes-256-cbc -a -salt -out "$output_file"
    echo -e "${GREEN}Clave encriptada y guardada en ${output_file}.${NC}"
}

# Función de desencriptación
decrypt() {
    read -p "Introduce el nombre del archivo a desencriptar: " input_file
    openssl enc -aes-256-cbc -d -a -in "$input_file" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo -e "\n${GREEN}Clave desencriptada correctamente.${NC}"
    else
        echo -e "\n${RED}Error: Clave o archivo incorrecto.${NC}"
    fi
}

# Menú de opciones
banner
echo "Selecciona una opción:"
echo "1) Encriptar clave"
echo "2) Desencriptar clave"
echo "3) Salir"
read -p "Opción: " option

case $option in
    1) encrypt ;;
    2) decrypt ;;
    3) echo "Saliendo..." ;;
    *) echo "Opción no válida." ;;
esac
