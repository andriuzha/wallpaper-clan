# Descarga masiva de wallpaper-clan

Estos dos script generan una descarga masiva de todos los wallpapers para escritorio de la página https://wallpapes-clan.com

El archivo descargaCategorias permite seleccionar la categoría de los wallpapers que se quieren descargar
El archivo descargaAbsoluta descargará todo el contenido que se encuentre alojado en la página

## Oservaciones:
En ambos casos los scripts generan una carpeta por categoría.
El nombre de los archivos se generan intactos.
Por ahora no es es posible seleccionar rangos de fecha, paginaciones o archivos en especifico. 
Solo descarga wallppers de escritorio, nada de teléfonos, stickers, etc.  
La descarga se realizará en el mismo directorio donde este el script.

## Instrucciones de uso:

Clona el repositorio
```sh
git clone https://github.com/andriuzha/wallpapers.git
```

Ingresa al directorio
```sh
cd wallpapers
```

Otorga permisos de ejecución al script que deses utilizar, por ejemplo 
```sh
chmod +x descargacategorías.sh 
```

Inicia el script
```sh
./descargacategorías.sh 
```

Sigue las instucciones y ten paciencia.  
