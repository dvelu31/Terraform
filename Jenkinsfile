pipeline {
    agent any
    environment {
        // If using AWS, configure credentials securely in Jenkins
        // AWS_ACCESS_KEY_ID = credentials('aws-access-key-id') // ID of your AWS credentials in Jenkins
        // AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/dvelu31/Terraform.git'
            }
        }
        stage('Terraform Init') {
            steps {
                dir('terraform') { // Change directory to your terraform project folder
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            // In a real scenario, you might have a manual approval step here
            // For this demo, we'll auto-apply
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        // Add a Terraform Destroy stage for cleanup (optional, be cautious in production)
        stage('Terraform Destroy (Optional)') {
            steps {
                input 'Proceed with Terraform Destroy?' // Manual input for destroy
                dir('terraform') {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished. Check infrastructure status.'
        }
        success {
            echo 'Infrastructure provisioning successful! 🎉'
        }
        failure {
            echo 'Infrastructure provisioning failed! ❌'
        }
    }
}
