// This is a Jenkinsfile, written in Groovy
pipeline {
    agent any

    stages {

        stage('1. Build & Test (CI)') { // <-- NOW THIS IS THE FIRST STAGE
            steps {
                echo 'Building and testing with Maven...'
                sh './mvnw clean install'
            }
        }

        stage('2. Build Docker Image (CD)') { // <-- Renumber this
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t my-sandbox-app . '
            }
        }

        stage('3. Deploy Sandbox (CD)') { // <-- Renumber this
            steps {
                echo 'Deploying application...'
                sh 'docker stop my-sandbox-app || true'
                sh 'docker rm my-sandbox-app || true'
                sh 'docker run -d --name my-sandbox-app -p 8081:8080 my-sandbox-app'
            }
        }
    }

    // This block runs after all stages, success or failure
    post {
        always {
            echo 'Pipeline finished.'
            // Clean up the Maven artifacts
            cleanWs()
        }
    }
}