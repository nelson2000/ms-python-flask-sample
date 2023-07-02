

pipeline {
    agent any


    stages {
        stage('Checkout the branch') {
                    steps {

                        sh "echo 'check out branch'"

                        // checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nelson2000/ms-python-flask-sample.git']])
           
                        }
                }

   
        stage('Build Docker Image') {
                    steps {

                        checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nelson2000/ms-python-flask-sample.git']])
                        sh "docker build -t nwajienelson/pythonapp:${buildNumber} . "
           
                        }
        }
        stage('login') {
            steps {

                
                sh '''
                        withCredentials([string(credentialsId: 'dockerhub_pwd', variable: 'dockerhub_pwd')]) {
                            sh " docker login -u nwajienelson -p ${dockerhub_pwd}"
                        }

                        sh "docker push nwajienelson/pythonapp:${buildNumber}"
                '''
            }
        }
        stage ('Push') {
            steps {
                sh '''
                        echo 'pushing....'
                '''
            }
        }
    }

    post {
        always {

            sh '''
                    echo 'posting...'
            '''
        }
    }
}




