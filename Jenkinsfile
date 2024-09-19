pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the public GitHub repository
                git 'https://github.com/ADHI18S/examease-2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile
                    sh 'docker build -t frontend-app .'
                }
            }
        }

        stage('Deploy Docker Image') {
            steps {
                script {
                    // SSH into the EC2 instance and deploy the Docker container
                    sh '''
                    ssh -o StrictHostKeyChecking=no ubuntu@your-ec2-public-ip << EOF
                        # Stop and remove existing container if it exists
                        docker stop frontend-app || true
                        docker rm frontend-app || true

                        # Run the new container
                        docker run -d -p 80:80 --name frontend-app frontend-app
                    EOF
                    '''
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the build
            cleanWs()
        }
    }
}

