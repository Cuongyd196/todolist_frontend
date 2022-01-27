pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS=credentials('DockerHub')
    }
    stages {

        stage('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
            }
        }
        stage('Build') {
            steps {
                echo 'Building image..'
                sh 'docker build -t cuongyd196/todoweb:1.0 .'
                
            }
        }
        stage('Pushing image') {
            steps {
                echo 'Start pushing.. with credential'
//                 sh 'echo $DOCKERHUB_CREDENTIALS'
//                 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push cuongyd196/todoweb:1.0'
                
            }
        }
        stage('Deploying and Cleaning') {
            steps {
                echo 'Deploying and cleaning'
                sh 'docker container run -d --rm --name todoweb -p 8082:8080 --network jenkins cuongyd196/todoweb:1.0'
            }
        }
    }
}
