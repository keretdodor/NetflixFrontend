pipeline {
    agent {
        label 'general'
    }
    
    triggers {
        githubPush()   // trigger the pipeline upon push event in github
    }
    
    environment {        
        IMAGE_TAG = "v1.0.$BUILD_NUMBER"
        IMAGE_BASE_NAME = "netflix-frontend"
        
        DOCKER_CREDS = credentials('dockerhub')
        DOCKER_USERNAME = "${DOCKER_CREDS_USR}"  // The _USR suffix added to access the username value 
        DOCKER_PASS = "${DOCKER_CREDS_PSW}"      // The _PSW suffix added to access the password value
    } 

    stages {
        stage('Docker setup') {
            steps {             
                sh '''
                  docker login -u $DOCKER_USERNAME -p $DOCKER_PASS
                '''
            }
        }
        
        stage('Build & Push') {
            steps {             
                sh '''
                  docker build -t "$DOCKER_USERNAME/$IMAGE_BASE_NAME:$IMAGE_TAG" /home/keretdodor/Desktop/Netflix/NetflixFrontend/
                  docker push "$DOCKER_USERNAME/$IMAGE_BASE_NAME:$IMAGE_TAG"
                '''
            }
        }
    }
}