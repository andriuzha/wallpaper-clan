#!/bin/bash

# Función para mostrar el menú
show_menu() {
    echo "Seleccione una categoría para descargar:"
    echo "1) Aesthetic"
    echo "2) Animals"
    echo "3) Anime"
    echo "4) Cartoons"
    echo "5) Comics"
    echo "6) Extra"
    echo "7) Games"
    echo "8) Holidays"
    echo "9) Meme"
    echo "10) Movies-TV"
    echo "11) Music"
    echo "12) Nature"
    echo "13) Vehicles"
    echo "14) Salir"
}

# Función para obtener los enlaces y descargar los archivos
download_wallpapers() {
    CATEGORY_URL=$1
    CATEGORY_NAME=$2

    # Obtener los enlaces y guardarlos en un archivo temporal
    curl -s "$CATEGORY_URL" | grep 'data-downloadurl=' | sed -n 's/.*data-downloadurl="\([^"]*\)".*/\1/p' > "$CATEGORY_NAME.txt"

    # Crear un directorio para los archivos descargados
    DOWNLOAD_DIR="${CATEGORY_NAME}_wallpapers"
    mkdir -p "$DOWNLOAD_DIR"

    # Leer cada línea del archivo y descargar
    while IFS= read -r url; do
        # Extraer el nombre del archivo de la URL
        filename=$(echo "$url" | sed 's/.*\/\(.*\)\/\?.*/\1/')".jpg"
        
        # Descargar el archivo con el nombre correcto
        curl -L -o "$DOWNLOAD_DIR/$filename" "$url"
    done < "$CATEGORY_NAME.txt"

    # Eliminar el archivo temporal
    rm "$CATEGORY_NAME.txt"

    echo "Descargas completadas para la categoría $CATEGORY_NAME."
}

# Mostrar el menú y gestionar la selección del usuario
while true; do
    show_menu
    read -p "Ingrese el número de la categoría que desea descargar: " choice
    case $choice in
        1)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/aesthetic/feed/" "aesthetic"
            ;;
        2)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/animals/feed/" "animals"
            ;;
        3)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/anime/feed/" "anime"
            ;;
        4)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/cartoons/feed/" "cartoons"
            ;;
        5)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/comics/feed/" "comics"
            ;;
        6)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/extra/feed/" "extra"
            ;;
        7)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/games/feed/" "games"
            ;;
        8)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/holidays/feed/" "holidays"
            ;;
        9)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/meme/feed/" "meme"
            ;;
        10)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/movies-tv/feed/" "movies-tv"
            ;;
        11)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/music/feed/" "music"
            ;;
        12)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/nature/feed/" "nature"
            ;;
        13)
            download_wallpapers "https://wallpapers-clan.com/desktop-wallpapers/category/vehicles/feed/" "vehicles"
            ;;
        14)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, intente de nuevo."
            ;;
    esac
done
