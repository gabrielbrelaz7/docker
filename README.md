Comandos Docker 

docker container ls	
Lista os contêineres que estão em execução. (docker ps)

docker container ls -a
Lista todos os contêineres.

docker image ls
Lista as imagens

docker volume ls
Lista os volumes

docker network ls
Lista as redes

docker info
Lista a quantidade de contêineres e imagens e informações do ambiente
 
docker stop $(docker ps -a -q)
Parar todos os contêineres em execução
 
docker rm $(docker ps -a -q)
Excluir todos os contêineres parados
 
docker rmi $(docker images -q) -f
Força exclusão das imagens
 
docker system prune
Remover contêineres , networks e imagens não usadas

docker system prune --all --force --volumes
Remover também os volumes e imagens não utilizadas

docker volume ls
Listar volumes por ID
 
docker volume rm <ID Volume>
Remove volume
