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
                sh 'docker push cuongyd196/todoweb:1.0'
                
            }
        }
        stage('Deploying and Cleaning') {
            steps {
                echo 'Deploying and cleaning'
                sh 'docker container run -d --rm --name todoweb -p 8082:8080 cuongyd196/todoweb'
            }
            post {
                success {
                    telegramSend 'success stage '
                }
                failure {
                    telegramSend 'failure stage '
                }
                
                unstable {
                    telegramSend ' unstable stage'
                }
                changed {
                    telegramSend 'Things were different before...'
                }
            }
        }
    }
}
