pipeline {
  agent {
    docker {
      image 'markhobson/maven-chrome'
      args '-v "$PWD":/usr/src -w /usr/src'
    }
  }

  stages {
    stage('Git Checkout') {
      steps {
        // Get some code from a GitHub repository
        git 'https://github.com/markhobson/docker-maven-chrome.git'
      }
    }

    stage('Chrome Tests') {
      steps {
        // Run Maven on docker agent.
        sh '''
          cd demo
          mvn clean verify
        '''
      }
      post {
        // If Maven was able to run the tests, even if some of the test
        // failed, record the test results.
        success {
          junit '**/target/surefire-reports/TEST-*.xml'
        }
      }
    }
  }
}
