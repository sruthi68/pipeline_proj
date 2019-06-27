node {
    stage('Checkout scm') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sruthi68/pipeline_proj.git']]])
    }
    stage('Create directory') {
        sh "mkdir test_dir"
    }
    stage('Checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'test_dir']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sruthi68/test.git']]])
    }
    stage('Checkout code') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sruthi68/test.git']]])
    }
    stage('Execute script') {
        sh "chmod 755 hello.sh"
        sh "./hello.sh"
    }
    stage('Archive files') {   
        archiveArtifacts '*.txt'
    }
    stage('Tree form') {
        sh 'tree test_dir'
        sh 'tree /var/lib/jenkins/workspace/pipeline_Job'
    }
}
node {
    stage('Print status') {
        echo "Pipeline status: ${currentBuild.currentResult}"
    }
}
