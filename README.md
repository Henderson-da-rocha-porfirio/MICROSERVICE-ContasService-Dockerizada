# Docker context - Uma única CLI do Docker pode ter vários contextos.
> - Cada contexto contém todas as informações de terminal e segurança necessárias para gerenciar um conjunto(cluster) ou nó(node) de servidores diferentes.
> - Os comandos relacionados ao "context" do Docker CLI, facilita a configuração desses contextos e a alternância entre eles.
### 1. Comando para verificar os contextos existentes:
````
docker context ls
````
### 2. Comando para inspecionar um contexto(nesse caso abaixo, o exemplo é a inspeção do contexto default):
````
docker context inspect default
````
### 3. Criando um novo contexto como exemplo:
````
docker context create docker-test
````
### 4. Usando um contexto diferente como exemplo:
````
docker context use docker-test
````
### Mais conceitos e comandos em [Docker Context](https://docs.docker.com/engine/context/working-with-contexts/)
