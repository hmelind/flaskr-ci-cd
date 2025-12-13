pipeline {
    agent any
    
    environment {
        GITHUB_REPO = 'https://github.com/hmelind/flaskr-devops.git'
        BRANCH = 'main'
    }
    
    stages {
        stage('Checkout'){
            steps {
                git branch: env.BRANCH, url: env.GITHUB_REPO
            }
        }

        stage('Install dependecies') {
            steps {
                sh '''
                    python3 -m venv .venv
                    . .venv/bin/activate
                    pip install -U pip
                    pip install -e .
                    pip install pytest
                '''
            }
        }
        
        stage('Init DB') {
            steps {
                sh '''
                    . .venv/bin/activate
                    flask --app flaskr init-db
                '''
            }
        }
        
        stage('Run tests') {
            steps {
                sh '''
                    . .venv/bin/activate
                    pytest
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'TODO'
            }
        }
        
    }
    
    post {
        success {
            echo 'SUCCESS'
        }
        failure {
            echo 'FAILURE'
        }
    }
}

