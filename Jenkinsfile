pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    environment {
        PATH = "C:/src/flutter/bin;${env.PATH}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Check Flutter') {
            steps {
                bat '''
                    git config --global --add safe.directory C:/src/flutter
                    echo PATH=%PATH%
                    where flutter
                    flutter --version
                    flutter doctor -v
                '''
            }
        }

        stage('Install Dependencies') {
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

        stage('Build APK') {
            steps {
                bat 'flutter build apk --release'
            }
        }
    }

    post {
        success {
            echo 'Expense App built successfully!'
            archiveArtifacts(
                artifacts: 'build/app/outputs/flutter-apk/app-release.apk',
                allowEmptyArchive: false
            )
        }

        failure {
            echo 'Build failed!'
        }
    }
}