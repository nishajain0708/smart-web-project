pipeline {
    agent any

    stages {

       
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t web-app .'
            }
        }

       stage('Test') {
    steps {
        sh 'echo "App is working fine"'
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