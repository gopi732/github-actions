pipeline {
    agent any
    environment {
        http_proxy = 'http://127.0.0.1:3128/'
        https_proxy = 'http://127.0.0.1:3128/'
        ftp_proxy = 'http://127.0.0.1:3128/'
        socks_proxy = 'socks://127.0.0.1:3128/' 
    }

    stages {

        stage ('Git Checkout') {
            steps {
                    git branch: 'master', credentialsId: 'github', url: 'https://github.com/gopi732/tomcat.git'
                }
        }
        
        stage ('Docker Image Build') {
            steps {
                sh 'docker build -t  mytomcat:1.0 .'
                
            }

        }
            
    }
}
