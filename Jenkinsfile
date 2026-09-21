pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    environment {
        ANDROID_HOME = 'C:/Users/govin/AppData/Local/Android/sdk'
        ANDROID_SDK_ROOT = 'C:/Users/govin/AppData/Local/Android/sdk'
        PATH = "C:/src/flutter/bin;C:/Users/govin/AppData/Local/Android/sdk/platform-tools;C:/Users/govin/AppData/Local/Android/sdk/cmdline-tools/latest/bin;${env.PATH}"
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
                    if not exist "%ANDROID_HOME%/platform-tools" (
                        echo Android SDK not found at %ANDROID_HOME%
                        exit /b 1
                    )
                    echo ANDROID_HOME=%ANDROID_HOME%
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