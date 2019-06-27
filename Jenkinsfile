node {
    stage('Checkout scm') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sruthi68/pipeline_proj.git']]])
    }
    stage('Execute') {
        sh 'pipeline_scriptt.sh'
    }
}
