pipeline {
    agent { dockerfile true }
    stages {
        stage('Mandatory question') {
            steps {
                sh 'python questions/mandatory_question.py'
            }
        }
        stage('Optional question') {
            steps {
                sh 'python questions/optional_question.py'
            }
        }
    }
}