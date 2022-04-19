
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
    
    stage('tfsec') {
      // agent { 
      //   docker { 
      //     image 'aquasec/tfsec-ci'
      //     reuseNode true
      //   }
      // }
      // steps {
      //   sh '''
      //     docker run --rm -it -v "$(pwd):/src" aquasec/tfsec ./ --no-color
      //   '''
      // }
      steps {
        sh 'chmod 755 ./tfsecw.sh'
        sh './tfsecw.sh'
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