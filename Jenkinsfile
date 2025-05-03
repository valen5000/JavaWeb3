pipeline {
    agent any
    
    stages {
        stage('Clean Old Artifacts') {
            steps {
                sh"""
                rm -rf target
                """
            }
        }

        stage('Build') {
            steps {
                sh"""
                mvn package
                """
            }
        }

        stage('Build Artifact') {
            steps {
                sh"""
                cd target
                aws s3 cp WebAppCal-*.war s3://myproject1-bucketcalculator/
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