
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

        result_file = sh (
          script: 'cat tfsec_results.xml'
        )
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
          slackSend channel: '', color: 'danger', message: '${result_file}', teamDomain: '', tokenCredentialId: 'secret-text' 
          error "TfSec Unstable"
        }
        failure {
          slackSend channel: '', color: 'danger', message: '${result_file}', teamDomain: '', tokenCredentialId: 'secret-text' 
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