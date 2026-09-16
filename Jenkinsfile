pipeline {
    agent any

    environment {
        PATH = "C:/src/flutter/bin;${env.PATH}"
    }

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