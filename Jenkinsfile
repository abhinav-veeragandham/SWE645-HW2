pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile
                sh 'docker build --no-cache -t abhinav31714/studentsurvey645 .'
            }
        }

        stage('Docker Login') {
            steps {
                // Log in to Docker Hub
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                // Push the built image to Docker Hub
                sh 'docker push abhinav31714/studentsurvey645'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // Update the Kubernetes deployment to use the new image
                sh 'kubectl set image deployment/survey-deployment survey=abhinav31714/studentsurvey645:latest -n default'
                sh 'kubectl rollout restart deployment/survey-deployment -n default'
            }
        }
    }

    post {
        always {
            // Ensure Docker logout happens after each run
            sh 'docker logout'
        }
    }
}
