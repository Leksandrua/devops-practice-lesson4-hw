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
    success {
            mail bcc: '', body: '${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\\n More info at: ${env.BUILD_URL}', cc: '', from: '', replyTo: '', subject: 'Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}', to: 'leksand.c@gmail.com'
        }
        failure {
            mail bcc: '', body: '${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\\n More info at: ${env.BUILD_URL}', cc: '', from: '', replyTo: '', subject: 'Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}', to: 'leksand.c@gmail.com'
        }
    }
}
