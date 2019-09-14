pipeline {
  agent any
  stages {
    stage('hi') {
      steps {
        echo 'hello world'
      }
    }
    stage('Lint   html') {
      steps {
        sh '''
                                               tidy -q -e templates/index.html
                                               tidy -q -e templates/addition.html
                                               tidy -q -e templates/sub.html
                                               tidy -q -e templates/mult.html
                                               tidy -q -e templates/div.html
                                               tidy -q -e templates/exp.html
                                          '''
      }
    }
    stage('Credentials') {
      steps {
        withCredentials(bindings: [[$class:  'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'bear1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
          sh """



                                                                 mkdir -p ~/.aws
                                                                 echo "[default]" >~/.aws/credentials
                                                                 echo "[default]" >~/.boto
                                                                 echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.boto
                                                                 echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" >>~/.boto
                                                                 echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.aws/credentials
                                                                 echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" >>~/.aws/credentials
                                                                   """
        }

      }
    }
    stage('docker login') {
      steps {
        sh 'cat password.txt | docker login --username beartuchman --password-stdin'
      }
    }
    stage('push docker') {
      steps {
        sh './push_docker.sh'
      }
    }
    stage('update eksctl') {
      steps {
        sh '''eksctl update cluster --region us-east-2 --name green

'''
      }
    }
    stage('config green') {
      steps {
        sh 'aws eks --region us-east-2 update-kubeconfig --name green'
      }
    }
    stage('context green') {
      steps {
        sh 'kubectl config use-context arn:aws:eks:us-east-2:480296741373:cluster/green'
      }
    }
    stage('update green') {
      steps {
        sh 'kubectl set image deployment/green green=beartuchman/capstone:newester5'
      }
    }
    stage('switch load') {
      steps {
        sh 'aws route53 change-resource-record-sets --hosted-zone-id Z2NPDQ55SYDTOZ --change-batch file://alias.json'
      }
    }
  }
}