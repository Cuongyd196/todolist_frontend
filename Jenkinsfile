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
                telegramSend ('Building job: $PROJECT_NAME ... - Link: $BUILD_URL')
            }
        }
        stage('Login to Docker Hub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW |  docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                echo 'Login Completed'
            }
        }

        stage('Push Image to Docker Hub') {
            steps{
                 sh 'sudo docker push <dockerhubusername>/<dockerhubreponame>:$BUILD_NUMBER'
                 echo 'Push Image Completed'
            }
        }

        stage('Build') {
            steps {
                echo 'Building image..'
                sh 'docker build -t cuongyd196/todoweb .'
                telegramSend ('Build - $PROJECT_NAME – # $BUILD_NUMBER – STATUS: $BUILD_STATUS!')
            }
        }

        stage('Deploying and Cleaning') {
            steps {
                echo 'Deploying and cleaning test'
                sh 'docker container run -d --rm --name todoweb -p 8085:8080 cuongyd196/todoweb'
                telegramSend ('Deploying - $PROJECT_NAME – # $BUILD_NUMBER – STATUS: $BUILD_STATUS!')
            }
        }
    }
}
