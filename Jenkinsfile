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
                    dockerImage = docker.build "devops-practice" + ":$BUILD_NUMBER"
                }
            }
        }
        
        stage('Testing image') {
            steps {
                sh 'dgoss run devops-practice:$BUILD_NUMBER'
            }
        }

        stage('Deploy Image') {
            steps {    
                script {
                    docker.withRegistry( 'https://index.docker.io/v2/', registryCredential ) {
                    dockerImage.push('leksandr/devops-practice')
                    }
                }
            }
        }
    }
    post {
    success {
            mail bcc: "", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\\n More info at: ${env.BUILD_URL}", cc: "", from: "Jenkins Admin <leksand.cs256@gmail.com>", replyTo: "", subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", to: "leksand.c@gmail.com"
        }
        failure {
            mail bcc: "", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\\n More info at: ${env.BUILD_URL}", cc: "", from: "Jenkins Admin <leksand.cs256@gmail.com>", replyTo: "", subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", to: "leksand.c@gmail.com"
        }
    }
}
