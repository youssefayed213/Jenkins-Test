pipeline{
    environment{
        mvnHome = tool 'maven-3.5.2'
        dockerImageTag = "devopsexample${env.BUILD_NUMBER}"
    }
    agent any
    stages{
        stage('Clone Repo') {
            steps{
                git 'https://github.com/rhmanou/Jenkins-Test.git'       
                mvnHome = tool 'maven-3.5.2'
            }
        }    
  
        stage('Build Project') {
            steps{
                sh "'${mvnHome}/bin/mvn' -B -DskipTests clean package"
            }
        }
        stage('Build Docker Image') {
            agent {
                docker {
                    dockerfile true
                    label 'docker'
                }
            }
            steps{
                dockerImage = docker.build("devopsexample:${env.BUILD_NUMBER}")
            }
        }
    
        stage('Deploy Docker Image'){
            steps{
                echo "Docker Image Tag Name: ${dockerImageTag}"
                sh "docker run --name devopsexample -d -p 2222:2222 devopsexample:${env.BUILD_NUMBER}"
            }
        }
    }
}
