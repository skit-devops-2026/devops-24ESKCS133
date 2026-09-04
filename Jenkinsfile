pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out Kishan Market source code'
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

        stage('Test') {
            steps {
                sh '''
                    echo "Frontend project build validation completed"
                    ls -la
                '''
            }
        }
    }
}