#!/bin/bash

# Caminho para o arquivo Docker Compose !!!
DOCKER_COMPOSE_FILE=$(find . -name "docker-compose.yml" -type f)

# Extrair informações do arquivo Docker Compose
DB_HOST=$(grep "GLPI_DB_HOST" "$DOCKER_COMPOSE_FILE" | awk -F= '{print $2}')
DB_NAME=$(grep "GLPI_DB_NAME" "$DOCKER_COMPOSE_FILE" | awk -F= '{print $2}')
DB_USER=$(grep "GLPI_DB_USER" "$DOCKER_COMPOSE_FILE" | awk -F= '{print $2}')
DB_PASSWORD=$(grep "GLPI_DB_PASSWORD" "$DOCKER_COMPOSE_FILE" | awk -F= '{print $2}')

# Exibir informações extraídas (apenas para depuração)
echo "DB_HOST: $DB_HOST"
echo "DB_NAME: $DB_NAME"
echo "DB_USER: $DB_USER"
echo "DB_PASSWORD: $DB_PASSWORD"

# Executar o comando docker-compose up -d
docker-compose -f "$DOCKER_COMPOSE_FILE" up -d

echo "Aguardando a criação do volume docker do GLPI"

sleep 60

# Caminho para o arquivo console
CONSOLE_FILE="/var/lib/docker/volumes/lab-glpi-container_glpi_data/_data/bin/console"

# Configurar permissões no diretório
chown www-data. /var/lib/docker/volumes/lab-glpi-container_glpi_data/_data -Rf
find /var/lib/docker/volumes/lab-glpi-container_glpi_data/_data -type d -exec chmod 755 {} \;
find /var/lib/docker/volumes/lab-glpi-container_glpi_data/_data -type f -exec chmod 644 {} \;


# Executar o comando php com as informações extraídas
cd /var/lib/docker/volumes/lab-glpi-container_glpi_data/_data/bin
php "$CONSOLE_FILE" glpi:database:install --db-host="$DB_HOST" --db-name="$DB_NAME" --db-user=root --db-password=admin

# Reajustar permissões
chown www-data. /var/lib/docker/volumes/lab-glpi-container_glpi_data/_data -Rf

