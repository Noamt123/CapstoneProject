docker build --tag=capstone1 .

dockerpath=beartuchman/capstone1

docker tag capstone ${dockerpath}:newester34

docker push ${dockerpath}:newester34
