Pasos de Instalación para Crud sector automotriz

1. Abrir terminal
2. Posicionarse desde la terminal en la carpeta donde quiere que se guarde el proyecto
3. Clonar proyecto ejecutando git clone https://github.com/ChrisN01/crud_sector_automotriz.git
4. Entrar al directorio raiz del proyecto: cd crud_sector_automotriz
5. Instalar dependencias ejecutando composer install en su terminal
6. Crear el archivo .env usando el comando "cp .env.example .env" o copy ".env.example .env"
7. Generar la key con el comando: php artisan key:generate
8. Crear BD en mysql con el nombre clients_bd
9. Realizar conexión de la BD en el .env con nombre de usuario y contraseña de mysql
10. Ejecutar el comando "npm i" en la terminal
11. Ejecutar migraciones y seeders con el comando "php artisan migrate --seed" o ejecutar el script clients_bd.sql el cual esta dentro de la carpeta del proyecto en una carpeta llamada "script"
12. En una nueva terminal ejecutar "npm run watch"
13. En otra terminal ejecutar php artisan serve
14. Abrir en el navegador http://127.0.0.1:8000