pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out Kishan Market source code'
                checkout scm
            }
        }

        stage('Verify Files') {
            steps {
                echo 'Checking Kishan Market files'

                sh '''
                    echo "Current directory:"
                    pwd

                    echo "Project files:"
                    ls -la

                    echo "Checking required files..."

                    test -f front1.html
                    test -f script1.js
                    test -f style.css

                    echo "All required files are present."
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Testing Kishan Market'

                sh '''
                    echo "Checking HTML file..."
                    test -s front1.html

                    echo "Checking JavaScript file..."
                    test -s script1.js

                    echo "Checking CSS file..."
                    test -s style.css

                    echo "All basic tests passed."
                '''
            }
        }

        stage('Package') {
            steps {
                echo 'Creating Kishan Market build artifact'

                sh '''
                    rm -rf kishan-market-build
                    mkdir -p kishan-market-build

                    cp front1.html kishan-market-build/
                    cp script1.js kishan-market-build/
                    cp style.css kishan-market-build/

                    zip -r kishan-market-build.zip kishan-market-build
                '''

                archiveArtifacts artifacts: 'kishan-market-build.zip',
                                 fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: Kishan Market pipeline completed successfully.'
            echo 'Build artifact kishan-market-build.zip was created.'
        }

        failure {
            echo 'FAILURE: Kishan Market pipeline failed.'
            echo 'Check the failed stage and Console Output.'
        }
    }
}