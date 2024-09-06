GIT_COMMIT=$(git rev-parse --short HEAD)
sudo docker build -t mmw-linter:$GIT_COMMIT -f docker/Dockerfile.linter .
