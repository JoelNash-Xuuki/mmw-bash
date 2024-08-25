sudo docker run -d -p 8080:80 docker/welcome-to-docker
sudo docker ps

docker stop d6cf136cdb66
sudo docker stop d6cf136cdb66
sudo docker ps
sudo systemctl status docker

sudo systemctl stop docker
sudo systemctl stop docker.socket

sudo systemctl disable docker
sudo systemctl disable docker.socket
sudo systemctl status docker
sudo ip link delete docker0
