pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Create Virtual Environment') {
            steps {
                sh '''
                python3 -m venv venv
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                . venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Verify Environment') {
            steps {
                sh '''
                . venv/bin/activate
                python --version
                pip --version
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                . venv/bin/activate
                nohup python3 run.py > flask.log 2>&1 &
                sleep 5
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                curl http://127.0.0.1:5000
                '''
            }
        }
    }
}
