# COPY - copiando arquivos com o comando COPY no Dockerfile

#### - Possíveis erros ao tentar rodar o copy na hora do build:

#### A. Dockerfile: no such file or directory([Buildkit](https://stackoverflow.com/questions/66839443/how-to-enable-disable-buildkit-in-docker))
 > 1. Você deve ajustar as configurações do daemon do Docker Engine, armazenadas no arquivo daemon.json, e reiniciar o mecanismo.
 > 2. No aplicativo Docker Desktop para Windows:

> 3. Abra o Painel > Configurações:
> 4. Selecione Docker Engine e edite o campo json de 'true' para 'false' se ainda não estiver.
#### B. Docker COPY failed: stat no source files were specified([Copy](https://jhooq.com/docker-copy-failed-no-source-files-were-specified/))
> 1. O caminho de origem pode está incorreto:
````
COPY build/lib/* /deployments/lib/
````
> - Solução:
````
a. Observe atentamente o caminho de origem - "build/lib/*", pode ser possível que esse caminho não exista.
````
````
b. Corrija o caminho de origem e execute novamente o comando docker build.
````
> 2. Arquivo incorreto:
````
COPY build/lib/hello-world.txt /deployments/lib/
````
> - Solução:
````
a. Pode ser possível que você não tenha "hello-world.txt" disponível no caminho de origem "build/lib/".
````
````
b. Para corrigir o problema, coloque "hello-world.txt" no caminho "build/lib/".
````
> 3. Nome incorreto da imagem de compilação do docker
````
FROM registry.access.redhat.com/ubi8/ubi-minimal:8.1
COPY build/lib/hello-world.txt /deployments/lib/
````
> - Solução: Aqui não especificamos o nome da imagem de compilação. Para corrigir isso, precisamos atribuir o "build" como nome da imagem -
````
FROM registry.access.redhat.com/ubi8/ubi-minimal:8.1 as build
COPY build/lib/hello-world.txt /deployments/lib/
````
#### C. COPY failed: no source files were specified is .dockerignore file present in your workspace([Copy](https://jhooq.com/docker-copy-failed-no-source-files-were-specified/))
> 1. Procure o arquivo .dockerignore porque a CLI do docker:
````
# ignore or exclude build directory
*/build*
*/*/build*
````
> - Solução:
````
a. Se o arquivo .dockerignore existir no contexto, pode ser possível que haja uma entrada de exclusão para ignorar o diretório de compilação.
````
````
b. Em ambos os casos acima, o diretório de compilação será excluído durante a execução do docker-compose ou do docker.
````
> 2. Trabalhando com o Gradle:
````
# ignore or exclude build directory
Run Clean - Se você deseja limpar a compilação anterior, vá em frente e execute a tarefa gradle->clean . Mas não se esqueça de executar as tarefas de compilação após a tarefa de limpeza.
````
> 3. Mais comandos e resoluções de [ADD & COPY](https://jhooq.com/docker-copy-vs-docker-add/)
