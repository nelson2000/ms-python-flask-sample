

pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('nwajienelson-dockerhub')
    }

    stages {
        stage('Build') {
            steps {


                sh '''
                        echo 'building....'
                '''
           
            }
        }
        stage('login') {
            steps {

                
                sh '''
                        echo 'login...'
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
                    echo 'posting...
            '''
        }
    }
}


      // git config --global user.name 'Nelson Nwajie'
                    // git config --global user.email 'nwajienelson@gmail.com'
                    // git clean -f
                    //         // git branch nelson
                    //         // git checkout nelson
