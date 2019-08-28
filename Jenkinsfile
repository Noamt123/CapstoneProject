pipeline {
  agent any
  stages {
    stage('hi') {
      steps {
        echo 'hello world'
      }
    }
    stage('Lint html') {
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
    stage('install pip') {
      steps {
        sh '''curl -O https://bootstrap.pypa.io/get-pip.py
'''
        sh 'python get-pip.py --user'
        sh 'ls -a ~'
        sh '''export PATH=~/.local/bin:$PATH
'''
        sh 'echo $SHELL'
        sh 'aws --version'
      }
    }
  }
}