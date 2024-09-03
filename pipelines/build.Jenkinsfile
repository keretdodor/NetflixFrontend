pipeline {
    agent {
        label 'general'
    }
    
    triggers {
        githubPush()   // Trigger the pipeline upon a push event in GitHub
    }
    
    environment {        
        IMAGE_TAG = "v1.0.${BUILD_NUMBER}"  // Dynamic versioning with build number
        IMAGE_BASE_NAME = "netflix-frontend"
        
        DOCKER_CREDS = credentials('dockerhub')
        DOCKER_USERNAME = "${DOCKER_CREDS_USR}"  // Access DockerHub username
        DOCKER_PASS = "${DOCKER_CREDS_PSW}"      // Access DockerHub password
        IMAGE_FULL_NAME = "${DOCKER_USERNAME}/${IMAGE_BASE_NAME}:${IMAGE_TAG}"  // Define image name with tag
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
                  docker tag 838773efc48e $IMAGE_FULL_NAME  // Use the dynamic IMAGE_FULL_NAME variable
                  docker push $IMAGE_FULL_NAME              // Push the tagged image to DockerHub
                '''
            }
        }
    }
}
