pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh"""
                ls src
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