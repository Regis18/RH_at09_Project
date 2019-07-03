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
        archiveArtifacts 'sampleWebApp/result/Reports.zip'
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
<<<<<<< HEAD
      emailext attachmentsPattern: 'sampleWebApp/result/Reports.zip', body: 'The test has finished', subject: 'Project Test', to: 'regis_enrique@hotmail.com'
=======
      emailext(attachmentsPattern: 'sampleWebApp/result/*.zip', body: 'The test has finished', subject: 'Project Test', to: 'regis_enrique@hotmail.com')

>>>>>>> d54982aaba2e9bed2d1a2d62ac9081d451d7f02e
    }

  }
}