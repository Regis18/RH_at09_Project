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
        sh './sampleWebApp/gradlew myZip -p sampleWebApp'
        archiveArtifacts 'sampleWebApp/result/*.zip'
      }
    }
    stage('Check') {
      steps {
        echo 'Checking'
        sh './sampleWebApp/gradlew check -p sampleWebApp'
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
      emailext attachmentsPattern: 'sampleWebApp/result/*.zip', body: 'The test has finished', subject: 'Project Test', to: 'regis_enrique@hotmail.com'
    }
  }
}