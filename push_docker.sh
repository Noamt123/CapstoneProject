docker build --tag=capstone .

dockerpath=beartuchman/capstone

docker tag capstone ${dockerpath}:newester3

docker push ${dockerpath}:newester3
