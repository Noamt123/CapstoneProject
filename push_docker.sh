docker build --tag=capstone .

docker run -p 5000:80 capstone

dockerpath=beartuchman/capstone

docker tag capstone ${dockerpath}:newester3

docker push ${dockerpath}:newester3
