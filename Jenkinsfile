

pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('nwajienelson-dockerhub')
    }

    stages {
        stage('Build') {
            steps {


                sh '''
                    docker build -t pythonapp:1.0 .
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


      // git config --global user.name 'Nelson Nwajie'
                    // git config --global user.email 'nwajienelson@gmail.com'
                    // git clean -f
                    //         // git branch nelson
                    //         // git checkout nelson