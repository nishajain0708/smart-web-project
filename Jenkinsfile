pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/nishajain0708/smart-web-project.git'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t web-app .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker rm -f web-container || true'
                sh 'docker run -d -p 8082:80 --name web-container web-app'
            }
        }
    }
}