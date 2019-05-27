docker build ./ -t ml-challenge:1.0
docker run -p 8888:8888 --name machine_learning ml-challenge:1.0
