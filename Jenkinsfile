
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out Kishan Market source code'
                checkout scm
            }
        }

        stage('Install') {
            steps {
                echo 'Installing project dependencies'

                sh '''
                    if [ -f package.json ]; then
                        echo "Installing root dependencies..."
                        npm install
                    fi

                    if [ -f frontend/package.json ]; then
                        echo "Installing frontend dependencies..."
                        cd frontend
                        npm install
                        cd ..
                    fi

                    if [ -f backend/package.json ]; then
                        echo "Installing backend dependencies..."
                        cd backend
                        npm install
                        cd ..
                    fi
                '''
            }
        }

        stage('Code Quality') {
            steps {
                echo 'Running code quality checks'

                sh '''
                    if [ -f package.json ]; then
                        npm run lint --if-present
                    fi

                    if [ -f frontend/package.json ]; then
                        cd frontend
                        npm run lint --if-present
                        cd ..
                    fi

                    if [ -f backend/package.json ]; then
                        cd backend
                        npm run lint --if-present
                        cd ..
                    fi
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests'

                sh '''
                    if [ -f package.json ]; then
                        npm test --if-present
                    fi

                    if [ -f frontend/package.json ]; then
                        cd frontend
                        npm test --if-present
                        cd ..
                    fi

                    if [ -f backend/package.json ]; then
                        cd backend
                        npm test --if-present
                        cd ..
                    fi
                '''
            }
        }

        stage('Build') {
            steps {
                echo 'Building Kishan Market application'

                sh '''
                    if [ -f package.json ]; then
                        npm run build --if-present
                    fi

                    if [ -f frontend/package.json ]; then
                        cd frontend
                        npm run build --if-present
                        cd ..
                    fi
                '''
            }
        }

        stage('Package') {
            steps {
                echo 'Creating Kishan Market build artifact'

                sh '''
                    rm -rf kishan-market-build
                    mkdir -p kishan-market-build

                    if [ -d frontend/dist ]; then
                        cp -R frontend/dist kishan-market-build/frontend
                    elif [ -d frontend/build ]; then
                        cp -R frontend/build kishan-market-build/frontend
                    elif [ -d dist ]; then
                        cp -R dist kishan-market-build/frontend
                    fi

                    if [ -d backend ]; then
                        cp -R backend kishan-market-build/backend
                    fi

                    zip -r kishan-market-build.zip kishan-market-build
                '''

                archiveArtifacts artifacts: 'kishan-market-build.zip', fingerprint: true
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
            echo 'Check the failed stage and Console Output for details.'
        }
    }
}