    pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '30'))
    }
    stages {
        stage('Create directory') {
            steps {
                sh "mkdir test_dir"
            }
        }
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'test_dir']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sruthi68/test.git']]])
            }
        }
        stage('Checkout code') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sruthi68/test.git']]])
        }
    }
        stage('Execute script') {
            steps {
                sh "chmod 755 hello.sh"
                sh "./hello.sh"
            }
        }
        stage('Archive files') {   
            steps {
                archiveArtifacts '*.txt'
            }
        }
        stage('Tree form') {
            steps {
                sh 'tree test_dir'
                sh 'tree /var/lib/jenkins/workspace/pipeline_Job'
            }
        }
    }
    post {
        always {
            echo "Pipeline currentResult: ${currentBuild.currentResult}"
        }
    }
}


