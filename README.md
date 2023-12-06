# **🔄 Verificação de Endpoint com CronJob no Kubernetes**

Este guia descreve como usar um CronJob no Kubernetes para verificar periodicamente a disponibilidade de um endpoint específico. Um script em Shell chamado **`check_endpoint.sh`** é utilizado para realizar a verificação, e diferentes versões do script são fornecidas para suportar diferentes métodos de autenticação.

## **Pré-requisitos**

- Docker instalado localmente.
- kubectl instalado e configurado para interagir com seu cluster Kubernetes.

## **Tipos de Autenticação Suportados**

O script **`check_endpoint.sh`** suporta três tipos de autenticação para atender às diferentes necessidades:

1. **Sem Autenticação (apenas URL):**
    - Dockerfile (Dockerfile_no_auth)
    - Script (check_endpoint_no_auth.sh)
    - YAML do CronJob (check-endpoint-cronjob_no_auth.yaml)
2. **Autenticação Basic:**
    - Dockerfile (Dockerfile_basic_auth)
    - Script (check_endpoint_basic_auth.sh)
    - YAML do CronJob (check-endpoint-cronjob_basic_auth.yaml)
3. **Autenticação Bearer:**
    - Dockerfile (Dockerfile_bearer_auth)
    - Script (check_endpoint_bearer_auth.sh)
    - YAML do CronJob (check-endpoint-cronjob_bearer_auth.yaml)

## **Como Usar**

1. **Escolha o Tipo de Autenticação:**
    - Escolha a versão do script e os arquivos associados com base no tipo de autenticação que seu endpoint requer.
2. **Construa a Imagem Docker:**
    - Execute o comando:
    
    ```bash
    docker build -t <you-docker-user>/<your-docker-image>:latest .              
    docker push <you-docker-user>/<your-docker-image>:latest
    ```
    
    - Para construir a imagem Docker correspondente ao tipo de autenticação escolhido.
3. **Aplique o YAML do CronJob ao Kubernetes:**
    - Execute o comando:
    
    ```bash
    **kubectl apply -f check-endpoint-cronjob_<auth-type>.yaml**
    ```
    
    - Para criar o CronJob no Kubernetes.

Agora, o CronJob está configurado para verificar periodicamente a disponibilidade do endpoint especificado com o método de autenticação escolhido. Personalize as variáveis de ambiente e argumentos conforme necessário.

Se encontrar qualquer problema ou tiver sugestões, sinta-se à vontade para contribuir! 🚀

---

Certifique-se de substituir **`<your-docker-image>` & `<your-docker-user>`** pela tag correta da sua imagem e usuário Docker para cada tipo de autenticação. Este README fornece uma estrutura geral para facilitar a adaptação a diferentes cenários de autenticação. Se tiver mais dúvidas ou precisar de mais ajuda, estou à disposição!