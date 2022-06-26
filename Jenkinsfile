pipeline {
    agent any
    
    environment {
        DOCKER_HUB_REPO = "saigopi123456/tomcat"
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        http_proxy = 'http://127.0.0.1:3128/'
        https_proxy = 'http://127.0.0.1:3128/'
        ftp_proxy = 'http://127.0.0.1:3128/'
        socks_proxy = 'socks://127.0.0.1:3128/'
    }

    stages {
        stage ('Git Checkout') {
            steps {
                git branch: 'feature2', credentialsId: 'github', url: 'https://github.com/gopi732/tomcat.git'
            }
        }
        
        stage ('Docker Image Build') {
            steps {
                sh 'docker build -t  $DOCKER_HUB_REPO:$BUILD_NUMBER .'
            }
        }
        stage ('DockerHub Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR  --password-stdin'
            }
        }
        stage ('Docker Push') {
            steps {
                sh 'docker push $DOCKER_HUB_REPO:$BUILD_NUMBER'
            }
        }
        stage ('Docker create container') {
            steps {
                sh 'docker run -d --name tomcon -p 9000:8080 --restart always $DOCKER_HUB_REPO:$BUILD_NUMBER'
            }
        }      
    }
}
