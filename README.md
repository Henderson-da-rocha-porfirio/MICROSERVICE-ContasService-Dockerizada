# Docker Comandos Principais
## - Comandos Docker
## - Containers
> - Start no Container(os dois dígitos alí referem-se aos dígitos iniciais do id do container que quer startar):
````
docker start f7
````
> - Start em dois Container(os dois dígitos alí referem-se aos dígitos iniciais dos ids dos containers que quer startar):
````
docker start f7 f6
````
> - Stop um container:
````
docker stop f7 ou f7 f6(se forem dois)
````
> - Matar o funcionamento de um Container:
````
docker kill f6
````
> - Pausar um container:
````
docker pause f7
````
> - Des-Pausar um container:
````
docker unpause f7
````
> - Listar os containers rodando:
````
docker ps
````
> - Ver os containers existentes:
````
docker ps -a
````
> - Verificar logs(os dois dígitos alí referem-se aos dígitos iniciais do id do container que quer verificar o log):
````
docker logs 84
````
> - Verificar logs continuamente:
````
docker logs -f 84
````
> - Remover um container:
````
docker container rm container_ID
````
> - Remover container 2:
````
docker rm f6 ou f6 f7(se forem dois)
````
> - Remover mais de um container:
````
docker container rm container_ID container_ID
````
> - Remover container criado:
````
docker run –-rm container_namedock
````
> - Para mais informações sobre remoção: [Docker Remove](https://www.hostinger.com.br/tutoriais/remover-imagem-docker?ppc_campaign=google_performance_max&gclid=CjwKCAjwsfuYBhAZEiwA5a6CDAOB8R3WLV36fzenVjmYOePjz5ikGfF8mZPs5RHCnzU7UTJ9T5ZbZBoCu5MQAvD_BwE)

> - Criando Novos Containers (novas instâncias), exemplo:
````
docker run -p 8081:8080 tag/nome-da-tag
````

## - Imagens
> - Listar as imagens:
````
docker images -a ou docker images
````
> - Remover uma imagem:
````
docker image rmi image_id
````
> - Remover mais de uma imagem:
````
docker images rmi image_id image_id
````
> - Remover imagens sem etiqueta/tags(dangling):
> 1. listar
````
docker images –f dangling=true
````
> - Remover imagens com force(forçadamente):
> 2. remover
````
docker rmi tuyosistema/loansdockerize --force
````
> 3. removendo geral
````
docker images purge
````
> - Inspecionar Imagem (saber versão, porta e etc):
````
docker image inspect df1
````
> - Inspecionar Container(saber versão, porta e etc):
````
docker container inspect f7
````
> - Mudando nomes de tags, exemplo:
````
docker tag OldName:tag NewName:tag
````
> - Mudar a tag conforme nome de usuário:
````
docker tag server:latest myname/server:latest ou com o ID docker tag d583c3ac45fd myname/server:latest
````
> - Remover antiga TAG:
````
docker rmi server
````
> - Construindo containers cuja imagem tenha um Dockerfile, exemplo:
````
docker build . -t tuyosistema/accounts
````

## - Estatísticas
> - Ver as estatísticas(nome, cpu %, memoria usada e etc):
````
docker stats
````
> - Criando Novos Containers (novas instâncias) sem ver os logs, exemplo:
````
docker run -d -p 8081:8080 tuyosistema/accounts-dockerizada
````

## - Docker Push
> - Verificar primeiro as imagens existentes:
````
docker images -a
````
> - Push para o repositório:
````
docker push nome-da-tag/nome-da-imagem
````
> - Push para o repositório exemplo:
````
docker push docker.io/hendersonporfirio/cardsconfigserver
````

## - Ispecionar a imagem criada (colocar apenas os três primeiros dígitos do ID. Esse você recebe depois de rodar docker images):
````
docker image inspect df1
````
### - Isso ajuda a verificar as paths da imagem criada.


## - Docker Compose
> - Para levantar os serviços(precisa ser executado de dentro da pasta docker-compose:
````
docker compose up
````
> - Para derrubar os serviços(precisa ser executado de dentro da pasta docker-compose):
````
 docker compose stop
````
