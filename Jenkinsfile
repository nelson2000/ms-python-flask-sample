

pipeline {
    agent any

    // environment {
    //     // DOCKERHUB_CREDENTIALS = credentials('nwajienelson-dockerhub')
    // }

    stages {
        stage('Checkout the branch') {
                    steps {

                        checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nelson2000/ms-python-flask-sample.git']])
           
                        }
        }

    stages {
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
                            sh " docker login -u nwajienelson -p ${dockerhub_pwd}
                        }

                        sh "docker push nwajienelson/pythonapp:${buildNumber}"
                '''
            }
        }
        stage('Push') {
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


      // git config --global user.name 'Nelson Nwajie'
                    // git config --global user.email 'nwajienelson@gmail.com'
                    // git clean -f
                    //         // git branch nelson
                    //         // git checkout nelson
