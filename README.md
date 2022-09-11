# Docker Push
> - Verificar primeiro as imagens existentes:
````
docker images -a
````
> - Mudar a tag conforme nome de usuário:
````
docker tag server:latest myname/server:latest ou com o ID docker tag d583c3ac45fd myname/server:latest
````
> - Remover antiga TAG:
````
docker rmi server
````
> - Push para o repositório:
````
docker image push nome-da-imagem
````
