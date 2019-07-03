pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Assemble'
        sh 'chmod +x ./sampleWebApp/gradlew'
        sh './sampleWebApp/gradlew assemble -p sampleWebApp'
        archiveArtifacts 'sampleWebApp/build/libs/*.jar'
      }
    }
    stage('Unit Test') {
      steps {
        echo 'Unit Test'
        sh './sampleWebApp/gradlew test -p sampleWebApp'
      }
    }
    post {
      always{
        junit "quickstart/build/test-results/test/*.xml"
        archiveArtifacts 'quickstart/build/reports/tests/test/*'
      }
    }
    stage('Check') {
      steps {
        echo 'Checking'
        sh './sampleWebApp/gradlew check -p sampleWebApp'
        sh './sampleWebApp/gradlew myZip -p sampleWebApp'
        archiveArtifacts 'sampleWebApp/result/*.zip'
      }
    }
    stage('Sonarqube') {
      steps {
        echo 'Sonarqube'
        sh './sampleWebApp/gradlew sonarqube -p sampleWebApp'
      }
    }
  }
  post {
    always {
      echo 'Sending the report to the client'
      emailext attachmentsPattern: 'sampleWebApp/result/Reports.zip', body: 'The test has finished', subject: 'Project Test', to: 'regis_enrique@hotmail.com'
    }

  }
}