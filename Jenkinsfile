pipeline {
    environment {
        registry = "leksandr/devops-practice"
        registryCredential = 'dockerhub'
    } 
    agent any

    stages {
        stage('Cloning Git') {
            steps {
                git branch: 'main', url: 'https://github.com/Leksandrua/devops-practice-lesson4-hw.git'
            }
        }
    
        stage('Building image') {
            steps {
                script {
                    docker.build "$JOB_NAME" + ":$BUILD_NUMBER"
                }
            }
        }
        
        stage('Testing image') {
            steps {
                sh 'dgoss run $JOB_NAME:$BUILD_NUMBER'
            }
        }
    }
    post {
        always {
            mail bcc: '', body: 'This is body of test message', cc: '', from: '', replyTo: '', subject: 'Jenkins job', to: 'leksand.c@gmail.com'
        }
    }
}
