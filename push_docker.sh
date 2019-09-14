docker build --tag=capstone .

dockerpath=beartuchman/capstone

docker tag capstone ${dockerpath}:newester5.2

docker push ${dockerpath}:newester5.2
