
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Validate Project Files') {
            steps {
                sh '''
                    test -f index.html
                    test -f front1.html
                    test -f front1.css
                    test -f script1.js
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                    echo "Frontend project build validation completed"
                    ls -la
                '''
            }
        }
    }
}