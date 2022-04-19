
pipeline {
  try {
    agent { label 'linux'}
    environment {
      def dockerHome = tool 'myDocker'
      PATH = "${dockerHome}/bin:${env.PATH}"
    }
    options {
      skipDefaultCheckout(true)
    }
    stages{
      stage('clean workspace') {
        steps {
          cleanWs()
        }
      }
      stage('Initialize') {
        steps {
          echo "env ${env.PATH}"
        }
      }
      stage('checkout') {
        steps {
          checkout scm
        }
      }
      stage('tfsec') {
        steps {
          echo "=========== Execute tfsec ================="
          // sh 'docker run --rm -i -v "$(pwd):/src" aquasec/tfsec /src --no-color'
          sh 'chmod 755 ./tfsecw.sh'
          sh './tfsecw.sh'
        }

        post {
          always { 
            echo "========= Check tfsec test results ========="
            junit allowEmptyResults: true, testResults: 'tfsec_results.xml'
          }
          success {
            echo "Tfsec passed" 
          }
          unstable {
            currentBuild.result = 'ABORTED'
            error "TfSec Unstable"
          }
          failure {
            currentBuild.result = 'ABORTED'
            error "Tfsec failed"
          }
        }
      }
      stage('terraform') {
        steps {
          sh 'ls .'
          sh 'chmod 755 ./terraformw'
          sh './terraformw apply -auto-approve -no-color'
        }
      }
    }
    post {
      always {
        cleanWs()
      }
    }
  } catch (e) {
  currentBuild.result = 'ABORTED'
  echo('Aborted Pipeline')
  return
}
}