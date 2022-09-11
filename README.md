# Erros no Build
#### - Possíveis erros ao tentar rodar o build:

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
#### D. ADD failed : No such file/Directory while building docker image([ADD](https://jhooq.com/docker-copy-failed-no-source-files-were-specified/))
> 1. Vamos dar um exemplo para entender esse problema com uma estrutura de diretórios muito simples com dois arquivos first.txt e second.txt:
````
Project/
    |--/home
           |--src/first.txt
           |--data/second.txt
Dockerfile
````
> - O arquivo que está provocando este erro:
````
ADD first.txt  /destination/
ADD second.txt /destination/
````
> - Então, estou supondo que você criará sua imagem do docker da seguinte maneira:
````
docker build -t myimage .
````
> - O problema: Para localizar esse problema, primeiro veja como o comando docker build está terminando, terminando com ponto (.), o que significa que o comando docker build procurará o primeiro.txt e o segundo.txt dentro do diretório /Project em vez de /Project/home /src , /Projeto/home/data:
> - Solução:
````
a. Para corrigir esse problema, precisamos atualizar o Dockerfile para selecionar first.txt e second.txt do diretório de origem correto.
````
````
b. Aqui está a versão correta do Dockerfile onde mencionamos o local de origem exato para escolher first.txt e second.txt:

 ADD /home/src/first.txt  /destination/
 ADD /home/src/second.txt /destination/
````
> 2. Permissão no caminho de destino e origem
````
Pode ser possível que seu dockerfileou docker-compose.yamlesteja correto, mas ainda assim você está recebendo erro na cópia do docker . Nesses casos, vale a pena verificar a permissão (read, writer, execute) do diretório de origem, bem como a direção de destino.
````
> 3. Mais comandos e resoluções de [ADD & COPY](https://jhooq.com/docker-copy-vs-docker-add/)
