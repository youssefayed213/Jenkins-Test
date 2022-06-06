pipeline{
    environment{
        mvnHome = tool 'maven-3.5.2'
        dockerImageTag = "devopsexample${env.BUILD_NUMBER}"
        dockerImage
    }
    agent any
    stages{
        stage('Clone Repo') {
            git 'https://github.com/rhmanou/Jenkins-Test.git'       
            mvnHome = tool 'maven-3.5.2'
        }    
  
        stage('Build Project') {
            sh "'${mvnHome}/bin/mvn' -B -DskipTests clean package"
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
            
            echo "Docker Image Tag Name: ${dockerImageTag}"
            
            sh "docker run --name devopsexample -d -p 2222:2222 devopsexample:${env.BUILD_NUMBER}"
        
        }
    }
}
