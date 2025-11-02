// This is a Jenkinsfile, written in Groovy
pipeline {
    // We need to use tools inside our pipeline
    agent any // This means "run on any available Jenkins agent"

    // Define the stages of our pipeline
    stages {

        stage('1. Checkout') {
            steps {
                // Get the code from the Git repo
                echo 'Checking out code...'
                git 'https://github.com/umar009-farooq/cicd-sandbox' // <-- REPLACE THIS
            }
        }

        stage('2. Build & Test (CI)') {
            steps {
                // Use the Maven wrapper to build and test
                echo 'Building and testing with Maven...'
                sh './mvnw clean install'
            }
        }

        stage('3. Build Docker Image (CD)') {
            steps {
                // 'my-sandbox-app' is the name we give to our image
                echo 'Building Docker image...'
                sh 'docker build -t my-sandbox-app . '
            }
        }

        stage('4. Deploy Sandbox (CD)') {
            steps {
                echo 'Deploying application...'
                // Stop any old container with the same name
                sh 'docker stop my-sandbox-app || true'
                // Remove the old container
                sh 'docker rm my-sandbox-app || true'

                // Run the new container!
                // Map port 8081 on your laptop to port 8080 in the container
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