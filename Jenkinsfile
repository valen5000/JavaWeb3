pipeline {
    agent any
    environment {
        IMAGE_NAME = "valen5000/javaweb3"
    }
    stages {
        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker rm -f javaweb3 || true'
                sh 'docker run -d --name javaweb3 -p 8081:8080 $IMAGE_NAME'
            }
        }
    }
}
