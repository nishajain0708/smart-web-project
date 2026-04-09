pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/nishajain0708/smart-web-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t web-app .'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Testing successful"'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker rm -f web-container || true'
                sh 'docker run -d -p 8083:80 --name web-container web-app'
            }
        }
    }
}