# Build
# Rodando o Build
````
docker build . -t tuyosistema/accounts
````
 >  - a. Entendendo:
 ````
"." = indica que ele está presente na mesma pasta local.

"-t" = indica que quero por um nome na tag relacionada a imagem.
 ````
 >  - b. Inspecionar a imagem criada (colocar apenas os três primeiros dígitos do ID pego quando rodar, antes, o comando docker images).
````
docker image inspect df1
````
 >  - Isso ajuda a verificar as paths da imagem criada, ou seja, obterá uma resposta no prompt:
 ````
 [
    {
        "Id": "sha256:df11311be37a1d676a244bad1860bbde78286b36daa9195b9e389f23c271e88a",
        "RepoTags": [
            "tuyosistema/accounts-dockerizada:latest"
        ],
        "RepoDigests": [],
        "Parent": "sha256:397917aa9c566fb9f22c04768143e8c8971642ddd1e43a5e0b08348fc03a6217",
        "Comment": "",
        "Created": "2022-09-10T21:55:02.0738709Z",
        "Container": "09fc2cac2796f660a1319df844bb8f9ebe7b7e6b7c2385d4993da6ee02c41ac9",
        "ContainerConfig": {
            "Hostname": "09fc2cac2796",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/openjdk-11/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "JAVA_HOME=/usr/local/openjdk-11",
                "LANG=C.UTF-8",
                "JAVA_VERSION=11.0.16"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "ENTRYPOINT [\"java\" \"-jar\" \"/accounts-dockerizada-0.0.1-SNAPSHOT\"]"
            ],
            "Image": "sha256:397917aa9c566fb9f22c04768143e8c8971642ddd1e43a5e0b08348fc03a6217",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "java",
                "-jar",
                "/accounts-dockerizada-0.0.1-SNAPSHOT"
            ],
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "20.10.17",
        "Author": "tuyosistema.com",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/openjdk-11/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "JAVA_HOME=/usr/local/openjdk-11",
                "LANG=C.UTF-8",
                "JAVA_VERSION=11.0.16"
            ],
            "Cmd": null,
            "Image": "sha256:397917aa9c566fb9f22c04768143e8c8971642ddd1e43a5e0b08348fc03a6217",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "java",
                "-jar",
                "/accounts-dockerizada-0.0.1-SNAPSHOT"
            ],
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 473187133,
        "VirtualSize": 473187133,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/3a709849d0ff128ae02dd050c565ed420cba4fbcd8079ccfb3be6c2517f4433b/diff:/var/lib/docker/overlay2/5717ae0d52dfe50c9ac4480c86445df57263ff40bf564d4b7644b640fd5f9443/diff:/var/lib/docker/overlay2/4f5cae587d700bd6d15fb6d8864ddc087693d387b0ba326a7ed92aec0abce2c5/diff:/var/lib/docker/overlay2/a891a37feaa463f5d9142df014cbb0cec36f3176208fb2392f87ef5d40c83b96/diff",
                "MergedDir": "/var/lib/docker/overlay2/89c0401408280cd731b4f94e2a59c52b21d66b65a11738b4c95ba3ebd649b889/merged",
                "UpperDir": "/var/lib/docker/overlay2/89c0401408280cd731b4f94e2a59c52b21d66b65a11738b4c95ba3ebd649b889/diff",
                "WorkDir": "/var/lib/docker/overlay2/89c0401408280cd731b4f94e2a59c52b21d66b65a11738b4c95ba3ebd649b889/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:92a4e8a3140f7a04a0e5a15793adef2d0e8889ed306a8f95a6cfb67cecb5f212",
                "sha256:eafe6e032dbd1979848a323c4c84071be765d175661d6ea2ac148dbd673c6713",
                "sha256:e3abdc2e92525469b91b8616216f3ab94b40c98f99e9690fd8505725fd7e1bfe",
                "sha256:eb6ee5b9581f8e84de2e1969953594b7cc976d142c426f8e989d49d9c95f63f5",
                "sha256:6b2a36f9f316b9df7ae5ba59c263bf39693be6bd336b782898d06aad055813a5"
            ]
        },
        "Metadata": {
            "LastTagTime": "2022-09-10T21:57:08.2408991Z"
        }
    }
]
````
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
