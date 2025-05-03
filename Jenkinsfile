pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh"""
                mvn package
                """
            }
        }
        stage('Deploy') {
            steps {
                sh"""
                cd ansible
                ansible-playbook -i aws_ec2.yml playbook.yml
                """
            }
        }
    }
}