pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {
        stage ('Git Checkout') {
            steps {
                git branch: 'feature2', credentialsId: 'github', url: 'https://github.com/gopi732/tomcat.git'
            }
        }
        
        stage ('Docker Image Build') {
            steps {
                sh 'docker build -t  saigopi123456/tomcat:$BUILD_NUMBER .'
            }
        }
        stage ('DockerHub Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR  --password-stdin'
            }
        }
        stage ('Docker Push') {
            steps {
                sh 'docker push saigopi123456/tomcat:$BUILD_NUMBER'
            }
        }
        stage ('Docker create container') {
            steps {
                sh 'docker run -d --name tomcatcont -P --restart always saigopi123456/tomcat:$BUILD_NUMBER'
            }
        }      
    }
}
