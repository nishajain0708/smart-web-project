pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nishajain0708/smart-web-project.git'
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
                sh 'docker run -d -p 8083:80 --name web-container web-app'
            }
        }

    }
}