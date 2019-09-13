docker build --tag=capstone .

dockerpath=beartuchman/capstone

docker tag capstone ${dockerpath}:newester4

docker push ${dockerpath}:newester4
