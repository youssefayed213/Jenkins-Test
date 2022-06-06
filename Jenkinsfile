pipeline{
    agent any
    stages{
        stage('Clone Repo') {
            steps{
                git 'https://github.com/rhmanou/Jenkins-Test.git'      
            }
        }    
  
        stage('Build Project') {
            environment{
                mvnHome = tool 'maven-3.5.2'
            }
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
                sh "docker build -t devopsexample:${env.BUILD_NUMBER} ."
            }
        }
    
        stage('Deploy Docker Image'){
            environment{
                dockerImageTag = "devopsexample${env.BUILD_NUMBER}"
            }
            steps{
                echo "Docker Image Tag Name: ${dockerImageTag}"
                sh "docker run --name devopsexample -d -p 2222:2222 devopsexample:${env.BUILD_NUMBER}"
            }
        }
    }
}
