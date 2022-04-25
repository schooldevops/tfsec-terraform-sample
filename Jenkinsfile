
pipeline {
  agent any
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
      failFast true
      steps {
        echo "=========== Execute tfsec ================="
        // sh 'docker run --rm -i -v "$(pwd):/src" aquasec/tfsec /src --no-color'
        sh 'chmod 755 ./tfsecw.sh'
        sh './tfsecw.sh'
      }

      post {
        always { 
          echo "========= Check tfsec test results ========="
          junit allowEmptyResults: true, testResults: 'tfsec_results.xml', skipPublishingChecks: true
        }
        success {
          slackSend channel: '', color: 'good', message: 'SUCCESSFUL', teamDomain: '', tokenCredentialId: 'secret-text'
          echo "Tfsec passed" 
        }
        unstable {
          script {
            TFSEC_RESULTS = sh (
              script: 'cat tfsec_results.xml',
              returnStdout: true
            ).trim()
            slackSend channel: '', color: 'danger', message: "[tfsec terraform] Unstable: ${TFSEC_RESULTS}", teamDomain: '', tokenCredentialId: 'secret-text' 
          }
          error "TfSec Unstable"
        }
        failure {
          script {
            TFSEC_RESULTS = sh (
              script: 'cat tfsec_results.xml',
              returnStdout: true
            ).trim()
            slackSend channel: '', color: 'danger', message: "[tfsec terraform] Failed: ${TFSEC_RESULTS}", teamDomain: '', tokenCredentialId: 'secret-text' 
          }
          error "Tfsec failed"
        }
      }
    }
    // stage('terraform') {
    //   failFast true
    //   steps {
    //     sh 'ls .'
    //     sh 'chmod 755 ./terraformw'
    //     sh './terraformw apply -auto-approve -no-color'
    //   }
    // }
  }
  post {
    always {
      cleanWs()
    }
  }
}