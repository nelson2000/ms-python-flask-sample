pipeline {
    agent any
    
     environment {
        DOCKER_CREDS = credentials('dockerhub_cred')
    }

    stages {

        stage('Checkout branch') {

            steps {
                
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nelson2000/ms-python-flask-sample.git']])
            }
        }
        
    stage('docker build') {
            steps {
                
                sh "docker build -t nwajienelson/pythonapp:${BUILD_NUMBER} . "
                
            }
        }
    
    stage('docker login') {
            steps {
                
                sh "docker login -u $DOCKER_CREDS_USR -p $DOCKER_CREDS_PSW "
                
            }
        }
    
      stage('docker push') {
            steps {
                
                sh "docker push nwajienelson/pythonapp:${BUILD_NUMBER} "
                
            }
        }
        
    
      stage('deploy App') {
            steps {
                
                sh "docker run -it -p 8500:8500 --name pythonapp nwajienelson/pythonapp:${BUILD_NUMBER}"
                
            }
        }
        
