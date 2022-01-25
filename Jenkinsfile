pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhub')
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
                sh 'echo $DOCKERHUB_CREDENTIALS'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push cuongyd196/todoweb:1.0'
                
            }
        }
        stage('Deploying and Cleaning') {
            steps {
                echo 'Deploying and cleaning'
                sh 'docker image rm cuongyd196/todoweb:1.0 || echo "this image does not exist" '
                sh 'docker container stop my-demo-springboot || echo "this container does not exist" '
                sh 'docker network create jenkins || echo "this network exists"'
                sh 'echo y | docker container prune '
                sh 'echo y | docker image prune'
                sh 'docker container run -d --rm --name todoweb -p 8081:8080 --network jenkins cuongyd196/todoweb:1.0'
            }
        }
    }
}