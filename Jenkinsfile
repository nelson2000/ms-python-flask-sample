

pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('nwajienelson-dockerhub')
    }

    stages {
        stage('Build') {
            steps {
                sh 'sudo chown jenkins:jenkins /var/run/docker.sock'
                sh 'chmod 777 -R ./jenkins'
                sh 'chown jenkins:jenkins ./jenkins'
                sh './jenkins/build.sh'
            }
        }
        stage('login') {
            steps {

                
                sh './jenkins/login.sh'
            }
        }
        stage('Push') {
            steps {
                sh './jenkins/push.sh'
            }
        }
    }

    post {
        always {

            sh './jenkins/logout'
        }
    }
}