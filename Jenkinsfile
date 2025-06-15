pipeline {
    agent any

    environment {
        TF_VERSION = '1.8.0' // Specify your Terraform version if needed
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/dvelu31/Terraform.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve Terraform Apply?'
                sh 'terraform apply tfplan'
            }
        }
    }

    post {
        always {
            echo "Cleaning up..."
            sh 'rm -f tfplan'
        }
    }
}
