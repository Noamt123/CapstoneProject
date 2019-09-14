docker build --tag=capstone1 .

dockerpath=beartuchman/capstone

docker tag capstone1 ${dockerpath}:newester5.1

docker push ${dockerpath}:newester5.1
