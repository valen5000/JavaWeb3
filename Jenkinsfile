pipeline {
    agent any
    environment {
        BUCKET_NAME="myproject1-bucketcalculator"
    }

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

        stage('upload Artifact') {
            steps {
                script {
                    // find the war file
                    def artifactName = sh{script: "cd target && ls WebAppCal-*.war", returnStdout: true).trim()

                    // set the artifact name as an enviroment variable
                    env.ARTIFACT_NAME = artifactName

                    // upload it to s3
                    sh """
                    cd target
                    aws s3 cp ${artifactName} s3://${BUCKET_NAME}/
                    """
            }
        }
    }

        stage('Deploy') {
            steps {
                sh"""
                cd ansible
                ansible-playbook -i aws_ec2.yml playbook.yml -e "BUCKET_NAME=${env.BUCKET_NAME}" ARTIFACT_NAME=${env.ARTIFACT_NAME}                """
            }
        }
    }
}