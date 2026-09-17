pipeline {
    agent any

    environment {
<<<<<<< HEAD
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
=======
        PATH = "/Users/varunpatil/fvm/default/bin:$PATH" // Flutter environment path
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo '1. Getting latest code from GitHub...'
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                echo '2. Fetching Flutter packages...'
                sh 'flutter pub get'
            }
        }

        stage('Build APK') {
            steps {
                echo '3. Building Android APK...'
                sh 'flutter build apk --release'
            }
        }
    }

    post {
        success {
            echo '🎉 Expense App built successfully!'
            archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', allowEmptyArchive: false
        }
        failure {
            echo '❌ Build failed!'
        }
    }
>>>>>>> 5d530d9 (Add Jenkinsfile recipe)
}