# Container
#### - Um contêiner é um ambiente vagamente isolado que nos permite construir e executar pacotes de software. 
> - Esses pacotes de software incluem o código e todas as dependências para executar aplicativos de forma rápida e confiável em qualquer ambiente de computação.
Chamamos essas imagens de contêineres de pacotes.

> - Pensando numa estrutura com containers, teremos  na base um único servidor físico, acima dele um sistema operacional como host. E nesses pode ser
instalado uma Docker Engine ou outro tipo de Engine para criar e manter os containers.
> - O Dockar Engine é o responsável em distribuir e a assinar os recursos por demanda para os containers.
> - Containers não necessitam de máquinas virtuais. Só é necessário ter as libraries(bibliotecas) necessárias para instalar e implantar o service.
> - O fato de não ter um sistema operacional dentro do container, é mais fácil reiniciá-lo. Então, para reiniciar um serviço, só levará alguns segundos.
> - Levando em conta isso, a escalibilidade dentro do cenário em questão, caso o serviço empréstimo esteja mais alto, eu posso incrementar novas instâncias
de Conta Service de 1 para 10 ou vice-versa, por exemplo.
> - Os containers podem ser reiniciados, desligados ou parados dentro de segundos, e os usuários finais não serão afetados mesmo com tudo isso acontecendo no backend.
> - A diferença chave entre containers e máquinas virtuais, é que o primeiro não precisa de sistemas operacionais.
> - Os containers possuem similaridade com as máquinas virtuais no que diz respeito às suas divisões e bibliotecas instaladas mas não afetarão outros containers.
> - Supondo possíveis cenários:
> - a. Bibliotecas(libraries): Se Conta Service precisa de bibliotecas java, é possível instalá-las dentro do Container 1, e isso não prejudicará em nada os Containers 2 e 3 por exemplo.
> - b. Versão/Linguagem: Se Conta Service usar o Java 8, o Empréstimo Service pode usar o java 11, e ainda Cartão Service pode usar o Python.
> - c. Estes são os tipos de limites e divisões que podem ser feitos e garantidos pelos containers que se assemelham a uma máquina virtual, mas óbvio, que indo mais além.
> - d. Os containers também serão muito mais leves e muito mais fáceis de manter, criar e pará-los, claro, com a ajuda do Docker Engine.
 
#### 1. Dando Start na imagem e criando um container:
````
docker run -p 8080:8080 tuyosistema/accounts-dockerizada
````
#### 2. Erro: Unable to access jarfile
- Soluções:
1. Tentar fechar e reabrir o terminal ou cmd.
2. Colcocar ".jar" aonde tiver o nome do arquivo. Tipo: accounts-dockerizada-0.0.1-SNAPSHOT.jar
3. Tentar apagar a pasta target e dar um novo mvn install: mvn clean install -Dmaven.test.skip=true -Dpmd.skip=true
4. Se possível apagar os containers primeiro e imagens associadas a eles e fazer um novo build.

#### 3. Criando Novas instâncias (novo container) através de outras portas:
````
docker run -p 8081:8080 tuyosistema/accounts-dockerizada
````

##### - Mudando as portas expostas, é possível rodar quantos containers quiser.
##### - Isso é muito fácil. Não precisa separar servidores virtuais e máquinas virtuais para criar imagens(aplicação) e containers(instâncias/aplicações filhas).
##### - Então, é possível usar a Docker Image para múltiplos ambientes.
##### - Pode-se fazer o Push da mesma Docker Image para o DockerHub Repository.
