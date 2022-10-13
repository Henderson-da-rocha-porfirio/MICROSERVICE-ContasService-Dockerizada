# Microserviço Contas Dockerizada com definições no Dockerfile(verificar e buscar outros repositórios meus com docker, buildpacks e docker-compose.yml)
### Acessando ao H2
### - Lembrar:
#### a. Criar um arquivo sql: data.sql
#### b. Configurar o application.properties
#### c. Adicionar no pom a dependência(pode ser pelo starters ou manualmente):
````
<dependency>
			<groupId>com.h2database</groupId>
			<artifactId>h2</artifactId>
			<scope>runtime</scope>
</dependency>
````
#### 1. Verificar no console o endpoint criado:
````
h2-console
````
#### 2. No navegador colocar o endpoint criado com a porta local cofigurado nas properties. Se não tiver sido configurada, ficará na 8080:
````
http://localhost:8080/h2-console/
````
#### 3. Quando abrir no console, colocar em JDBC URL, se der algum erro, o que saiu no console, por exemplo:
````
 H2 console available at '/h2-console'. Database available at 'jdbc:h2:mem:testdb'
````
#### 4. Testando no Postman:
````
http://localhost:8080/myAccount
````
##### - se der um erro 415: Content type 'text/plain;charset=UTF-8' not supported], colocar no Headers:
````
1. KEY: Content-Type
2. VALUE: application/json
````
#### 5. A beleza dos Microservices: Não há nada acoplado da regra de negócio com os microserviços cartões ou empréstimos.

#### Correndo o docker image com a porta num terminal ou cmd:
````
docker run -p 8080:8080 hendersonporfirio/microservice-account

````
