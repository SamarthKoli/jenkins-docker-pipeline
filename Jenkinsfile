pipeline{
    agent any

     environment {
        IMAGE = "samarthkoli/simple-jenkins-docker:latest"
        DOCKER_CRED = "dockerhub-cred"
    }
    tools{
        maven 'jenkins-maven'
    }

    stages{
        stage('Build'){
            steps{
                bat 'mvn clean package -DskipTests'
            }


        }
        stage('Build docker image'){
            steps{
                bat "docker build -t %IMAGE% ."
                
            }
        }
        stage('push image'){
            steps{
                  withCredentials([usernamePassword(credentialsId: DOCKER_CRED, usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    bat "echo $PASS | docker login -u $USER --password-stdin"
                    bat "docker push ${IMAGE}"
            }
        }
    }

    }
}