pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    environment {
        DOCKER_HUB_USERNAME = "ycetindil" // Should match with the var.docker_hub_username
        APP_NAME = "wordpress" // Should match with the var.prefix
    }

    stages {

        stage('Build App Docker Images') {
            steps {
                echo 'Building App Images'
                sh 'docker build --force-rm -t "$DOCKER_HUB_USERNAME/$APP_NAME" .'
                sh 'docker image ls'
            }
        }

        stage('Docker Login'){
            steps {
                echo 'Docker Login'
                withCredentials([string(credentialsId: 'DOCKER_HUB_TOKEN', variable: 'DOCKER_HUB_TOKEN')]) {
                    sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_TOKEN'
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                echo 'Pushing App Image to Docker Hub'
                sh 'docker push "$DOCKER_HUB_USERNAME/$APP_NAME"'
            }
        }

        stage('Create Infrastructure for the App') {
            steps {
                sh 'az login --identity'
                echo 'Creating Infrastructure for the App'
                sh 'terraform init'
                sh 'terraform apply --auto-approve'
            }
        }

        stage('Destroy the Infrastructure') {
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message:'Do you want to terminate?'
                }
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}