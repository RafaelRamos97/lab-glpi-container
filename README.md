# Instalação Automática do GLPI com Docker

Este repositório foi realizado na intenção de estudar sobre docker e linux, o mesmo contém um script para automatizar a criação e configuração do GLPI para um ambiente Docker, proporcionando uma instalação e configura fácil e rápida.

## Pré-requisitos

Antes de começar, certifique-se de ter o Docker e o Docker Compose instalados no seu sistema. Você pode instalá-los seguindo as instruções em [Docker](https://docs.docker.com/get-docker/) e [Docker Compose](https://docs.docker.com/compose/install/).

## Como Usar

1. Clone este repositório:

   ```bash
   git clone https://github.com/RafaelRamos97/lab-glpi-container.git

2. Acesse a o repositorio:
   ```bash
   cd lab-glpi-container
      
4. Após acessar o repositorio transforme o script glpi.sh em um arquivo executavel com este comando:
   ```bash
   chmod +x glpi.sh

5. Em seguita acione o script com o seguinte comando:
   ```bash
   ./glpi.sh

5 . Após o script finalizar você vai se deparar com a ultima etapa para a configuração do banco do glpi...

Confirme com "Y" / "y" ou "yes" sobre as configurações do banco

<img width="893" alt="Passo 1" src="https://github.com/RafaelRamos97/lab-glpi-container/assets/49218736/ef19ae14-e44c-4bd0-9510-526c31900a9d">

6 . Confime com "Y" ou "n" caso queira compartilhar dados de statisticas com a equipe do GLPI.

<img width="941" alt="Passo 2" src="https://github.com/RafaelRamos97/lab-glpi-container/assets/49218736/5065dbff-febc-447b-bf7e-759af6aa6b65">

7. Acesse o navegador e seja feliz :D
   ````bash
   http://localhost:8082/

