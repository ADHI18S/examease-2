pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // Pull the code from GitHub
                git 'https://github.com/ADHI18S/examease.git'
            }
        }
        
        stage('Docker Build') {
            steps {
                // Build Docker image
                sh 'docker build -t adhi .'
            }
        }
        
        stage('Docker Run') {
            steps {
                // Run Docker container
                 sh '''
                # Stop the existing container if it's running
                docker stop adhi || true

                # Remove the old container if it exists
                docker rm adhi || true

                # Run a new container with the built image
                docker run -d -p 80:80 --name adhi adhi
                '''
            }
        }
    }
    

}
