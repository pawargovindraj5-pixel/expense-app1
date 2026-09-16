pipeline {
    agent any

    stages {
        stage('Install dependencies') {
            steps {
                bat 'flutter pub get'
            }
        }
        stage('Analyze') {
            steps {
                bat 'flutter analyze'
            }
        }
        stage('Test') {
            steps {
                bat 'flutter test'
            }
        }
    }
}