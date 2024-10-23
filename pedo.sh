#!/bin/bash

# Función para mostrar mensajes
show_message() {
  echo "====> $1"
}

# Mostrar mensaje de inicio
show_message "Iniciando configuración..."

# Ejecutar expansión del sistema de archivos
show_message "Ejecutando expansión del sistema de archivos..."
sudo raspi-config nonint do_expand_rootfs

# Actualizar el sistema
show_message "Actualizando el sistema..."
sudo apt update
sudo apt upgrade -y

# Mostrar mensaje de instalación de PHP
show_message "Instalando PHP..."
sudo DEBIAN_FRONTEND=noninteractive apt install php -y

# Mostrar mensaje de habilitar SSH
show_message "Habilitando SSH..."
sudo systemctl enable ssh
sudo systemctl start ssh

# Mostrar mensaje de cambio de contraseña
show_message "Cambiando contraseña del usuario root..."
echo 'root:$Turnos123$5' | sudo chpasswd

# Mostrar mensaje de instalación de MariaDB Server
show_message "Instalando MariaDB Server..."
sudo DEBIAN_FRONTEND=noninteractive apt install mariadb-server -y

# Mostrar mensaje de instalación de php-mysql
show_message "Instalando php-mysql..."
sudo DEBIAN_FRONTEND=noninteractive apt install php-mysql -y

# Mostrar mensaje de ejecución de mysql_secure_installation
show_message "Ejecutando mysql_secure_installation..."
echo -e "Y\nroot\nroot\nY\nY\nY\nY" | sudo mysql_secure_installation

# Mostrar mensaje de ejecución de comandos SQL en MySQL
show_message "Ejecutando comandos SQL en MySQL..."
sudo mysql -uroot -proot <<EOF
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;
exit
EOF

if [ -f "todo.sql" ]; then
    # Mostrar mensaje de ejecución de script SQL en MySQL
    show_message "Ejecutando script SQL en MySQL..."
    sudo mysql -uroot -proot < todo.sql
else
    show_message "El archivo todo.sql no se encuentra en la ruta."
fi

if [ -f "todo2.sql" ]; then
    # Mostrar mensaje de ejecución de script SQL en MySQL
    show_message "Ejecutando script SQL en MySQL..."
    sudo mysql -uroot -proot < todo2.sql
else
    show_message "El archivo todo2.sql no se encuentra en la ruta."
fi

# Ejecutar phpenmod mysqli (con respuesta "Sí")
show_message "Ejecutando phpenmod mysqli..."
echo "Y" | sudo phpenmod mysqli


# Verifica si Git está instalado
if ! command -v git &> /dev/null; then
    echo "Git no está instalado. Instalando Git..."
    sudo apt-get update
    sudo apt-get install -y git
    echo "Git instalado correctamente."
else
    echo "Git ya está instalado."
fi

# Verifica si NVM está instalado
if ! command -v nvm &> /dev/null; then
    echo "NVM no está instalado. Instalando NVM..."
    
    # Descargar e instalar NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    
    # Cargar NVM en el entorno actual
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    echo "NVM instalado correctamente."
else
    echo "NVM ya está instalado."
fi

# Instalar la última versión estable de Node.js usando NVM
echo "Instalando la última versión de Node.js..."
nvm install node
nvm use node

# Verifica si pm2 está instalado globalmente
if ! command -v pm2 &> /dev/null; then
    echo "pm2 no está instalado. Instalando pm2 globalmente..."
    npm install -g pm2
    echo "pm2 instalado correctamente."
else
    echo "pm2 ya está instalado."
fi

# Clonar el repositorio de Git 
REPO_URL="https://foianini:ghp_isXQfWPbRdrFbjNIGlm3qBt2P5qjn@github.com/foianini/rapsberrysSistema.git"
DIRECTORIO_REPO="rapsberrysSistema"

echo "Clonando el repositorio..."
git clone "$REPO_URL" "$DIRECTORIO_REPO"

# Cambia al directorio del repositorio clonado
cd "$DIRECTORIO_REPO" || exit

# Ejecutar npm install
echo "Ejecutando npm install..."
npm install



# Iniciar la aplicación usando pm2
echo "Iniciando la aplicación con pm2..."
pm2 start index.js

echo "Proceso completado con éxito."
