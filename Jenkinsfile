@Library('jenkins-mav') _

pipeline {
   agent any
   environment {
   DOCKERHUB_CREDENTIALS = credentials('rehan1114-dockerhub')
   }
    stages {
        
        stage('Build ') {
            steps {
                script{
                mvnUtils.buildProject('-DskipTests')
            }
            }
        }

       stage('Evaluate Test Results') {
            steps {
                script {
                    testUtils.checkTestResults(this)
                }
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
              script {
                    sonarUtils.analyzeProject(this)
                }
                }
            }
      
        stage('docker build & push'){
            steps{
                script{
                    script {
                    dockerUtils.buildImage(this)
                    dockerUtils.loginDocker(this)
                    dockerUtils.pushImage(this)
                    dockerUtils.runContainer(this)
                }
                }
            }
        }
        
        }
}
