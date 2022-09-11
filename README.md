# Add - Adicionando arquivos através do Dockerfile
````
ADD first.txt  /destination/
````
## Possíveis Erros com o ADD:
#### - ADD failed : No such file/Directory while building docker image([ADD](https://jhooq.com/docker-copy-failed-no-source-files-were-specified/))
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
