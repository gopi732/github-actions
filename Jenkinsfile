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
        stage ('Docker Image Build') {
            steps {
                sh 'docker build -t  $DOCKER_HUB_REPO:$BUILD_NUMBER .'
            }
        }
        stage ('DockerHub Login and push') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR  --password-stdin'
                sh 'docker push $DOCKER_HUB_REPO:$BUILD_NUMBER'
            }
        }
    }
}
