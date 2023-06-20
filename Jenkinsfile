

pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('nwajienelson-dockerhub')
    }

    stages {
        stage('Build') {
            steps {


                sh '''
                    git config --global user.name 'Nelson Nwajie'
                    git config --global user.email 'nwajienelson@gmail.com'
                    git clean -f
                    git branch nelson
                    git checkout nelson
                    docker version
                    sudo groupadd docker
                    sudo usermod -aG docker $USER
                    echo $USER
                    sudo su - $USER
                    docker ps
                    echo "lets do a docker ps"
                    docker ps
                    ./jenkins/build.sh

                '''
           
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