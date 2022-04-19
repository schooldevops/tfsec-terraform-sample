
pipeline {
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
    // stage("Test Terraform files"){
    //   steps{
    //     echo "========Executing Test case for Terraform files======="
    //     container('tfsec'){
    //       dir('terraform') {
    //         sh "echo \$(pwd)"
    //         sh "tfsec -f junit > tfsec_test.xml"
    //       }
    //     }
    //   }
    //   post{
    //     always{
    //       echo "========always========"
    //       dir('terraform') {
    //         junit checksName: 'Terraform security checks', testResults: "tfsec_test.xml"
    //       }
    //     }
    //     success{
    //       echo "Terraform test case passed"
    //     }
    //     failure{
    //       echo "Terraform test case failed"
    //     }
    //   }
    // }
    
    stage('tfsec') {
      steps {
        echo "=========== Execute tfsec ================="
        script{ 
          sh 'docker run --rm -v "$(pwd):/src" aquasec/tfsec /src --no-color'

          // sh 'chmod 755 ./tfsecw.sh'
          // sh './tfsecw.sh'
        }
      }
      post {
        always { 
          echo "========= Check tfsec test results ========="
          junit allowEmptyResults: true, testResults: 'tfsec_results.xml'
        }
        success {
          echo "Tfsec passed"
        }
        failure {
          echo "Tfsec failed"
        }
      }
    }
    // stage('terraform') {
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