#!/bin/bash

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

# Lista de categorías y sus URLs
categories=(
    "aesthetic|https://wallpapers-clan.com/desktop-wallpapers/category/aesthetic/feed/"
    "animals|https://wallpapers-clan.com/desktop-wallpapers/category/animals/feed/"
    "anime|https://wallpapers-clan.com/desktop-wallpapers/category/anime/feed/"
    "cartoons|https://wallpapers-clan.com/desktop-wallpapers/category/cartoons/feed/"
    "comics|https://wallpapers-clan.com/desktop-wallpapers/category/comics/feed/"
    "extra|https://wallpapers-clan.com/desktop-wallpapers/category/extra/feed/"
    "games|https://wallpapers-clan.com/desktop-wallpapers/category/games/feed/"
    "holidays|https://wallpapers-clan.com/desktop-wallpapers/category/holidays/feed/"
    "meme|https://wallpapers-clan.com/desktop-wallpapers/category/meme/feed/"
    "movies-tv|https://wallpapers-clan.com/desktop-wallpapers/category/movies-tv/feed/"
    "music|https://wallpapers-clan.com/desktop-wallpapers/category/music/feed/"
    "nature|https://wallpapers-clan.com/desktop-wallpapers/category/nature/feed/"
    "vehicles|https://wallpapers-clan.com/desktop-wallpapers/category/vehicles/feed/"
)

# Preguntar al usuario si desea descargar todas las categorías
read -p "¿Desea descargar todas las categorías de wallpapers? (s/n): " choice
if [[ "$choice" =~ ^[Ss]$ ]]; then
    for category in "${categories[@]}"; do
        IFS='|' read -r CATEGORY_NAME CATEGORY_URL <<< "$category"
        download_wallpapers "$CATEGORY_URL" "$CATEGORY_NAME"
    done
    echo "Todas las descargas completadas."
else
    echo "Operación cancelada."
    exit 0
fi
