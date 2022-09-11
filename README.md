# Dockerfile
### É a forma básica de criar uma Docker Image do projeto ou de uma outra Aplicação com Spring Boot.
### Crie um arquivo Dockerfile sem nenhuma extensão.

#### - Um arquivo Dockerfile deve conter, como exemplo, neste projeto(ele pode também conter outros comandos):
#### 1. FROM openjdk:11-slim as build
#### Começo com a imagem base que contém o Java runtime. Coloco openjdk porque necessito dela na minha aplicação.
#### E este comando diz que quero iniciar meu Dockerfile e que quero instalar o Java dentro do meu Container Docker.
#### A base openjdk:11-slim eu pego a referência do dockerhub. Existem outras.

#### 2. MAINTAINER tuyosistema.com
#### Informação sobre quem criou ou mantém a imagem.

#### 3. COPY target/accounts-dockerizada-0.0.1-SNAPSHOT accounts-dockerizada-0.0.1-SNAPSHOT
#### Adicionar o jar da aplicação ao container. Esse jar é o que contém o jar da aplicação SpringBoot que criei, e que
#### contém toda a lógica do negócio e todas as dependências que o SpringBoot necessita.
#### E ao criar a Docker image e o Container, como serviço isolado, eles terão seu próprio sistema de arquivos, sua
#### própria memória de alocação e sua própra network.

#### 4. ENTRYPOINT ["java","-jar","/accounts-dockerizada-0.0.1-SNAPSHOT"]
#### Comando para executar a aplicação. Ele iniciará o container.
#### É como se eu estivesse rodando no terminal: java -jar target/accounts-dockerizada-0.0.1-SNAPSHOT

````
FROM openjdk:11-slim as build

MAINTAINER tuyosistema.com

COPY target/accounts-dockerizada-0.0.1-SNAPSHOT.jar accounts-dockerizada-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","/accounts-dockerizada-0.0.1-SNAPSHOT"]
````
