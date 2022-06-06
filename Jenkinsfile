node {
    def mvnHome = tool 'maven-3.5.2'
    def dockerImage
    def dockerImageTag = "devopsexample${env.BUILD_NUMBER}"
    
    stage('Clone Repo') {
      git 'https://github.com/rhmanou/Jenkins-Test.git'
    }    
  
    stage('Build Project') {
      sh "'${mvnHome}/bin/mvn' -B -DskipTests clean package"
    }
    stage('Build Docker Image') {
      sh "docker build -t devopsexample:${env.BUILD_NUMBER} ."
    }
   
    stage('Deploy Docker Image'){
      echo "Docker Image Tag Name: ${dockerImageTag}"
      sh "docker run --name devopsexample -d -p 2222:2222 devopsexample:${env.BUILD_NUMBER}"
        
    }
}
