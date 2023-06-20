

pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('nwajienelson-dockerhub')
    }

    stages {
        stage('Build') {
            steps {


                sh '''
            
                    useradd jenkins
                    su - jenkins
                    usermod -aG docker jenkins
                    echo $USER
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


      // git config --global user.name 'Nelson Nwajie'
                    // git config --global user.email 'nwajienelson@gmail.com'
                    // git clean -f
                    //         // git branch nelson
                    //         // git checkout nelson