pipeline {
    agent { dockerfile true }
    stages {
        stage('Mandatory question') {
            steps {
                sh 'python mandatory_question.py'
            }
        }
        stage('Optional question') {
            steps {
                sh 'python optional_question.py'
            }
        }
    }
}