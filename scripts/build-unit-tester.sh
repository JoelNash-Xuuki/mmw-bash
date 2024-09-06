GIT_COMMIT=$(git rev-parse --short HEAD)
sudo docker build -t mmw-unit-tester:$GIT_COMMIT -f docker/Dockerfile.unit-test .
