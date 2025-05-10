pipeline {
    agent any
    environment {
        IMAGE_NAME = "valen5000/javaweb3"
    }
    stages {
        stage('Build WAR') {
            steps {
                // Build the WAR file using Maven
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build Docker image using the Dockerfile
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    // Log in to Docker Hub
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    // Push the image to Docker Hub
                    sh 'docker push $IMAGE_NAME:latest'
                }
            }
        }
        stage('Run Container') {
            steps {
                // Remove any existing container (if any)
                sh 'docker rm -f javaweb3 || true'
                
                // Run the container, mapping port 8081 on the host to port 8080 in the container
                sh 'docker run -d --name javaweb3 -p 8081:8080 $IMAGE_NAME:latest'
            }
        }
    }
}
