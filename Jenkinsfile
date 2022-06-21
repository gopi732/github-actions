pipeline {
    agent any

    stages {

        stage ('Git Checkout') {
            steps {
                    git branch: 'master', credentialsId: 'github', url: 'https://github.com/gopi732/tomcat.git'
                }
        }
        
        stage ('Docker Image Build') {
            steps {
                sh 'docker build -f Dockerfile -t  mytomcat:1.0 .'
                
            }

        }
            
    }
}
