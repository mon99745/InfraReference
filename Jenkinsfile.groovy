node {
    env.BRANCH_NAME = params.BRANCH_NAME
    env.STAGE_NAMES = params.STAGE_NAMES
    env.STEP_NAMES = params.STEP_NAMES
    env.analyze = ''
    currentBuild.result = 'SUCCESS'

    try {
        stage('scm') {
            // MR
            if (env.gitlabSourceBranch != null) {
                env.BRANCH_NAME = env.gitlabSourceBranch
                env.STAGE_NAMES = 'demo'
                env.STEP_NAMES = 'build, analyze, test, deploy'
            }
            println "BRANCH_NAME: ${env.BRANCH_NAME}"
            println "STAGE_NAMES: ${env.STAGE_NAMES}"
            println "STEP_NAMES: ${env.STEP_NAMES}"

            git branch: env.BRANCH_NAME, credentialsId: 'github-login', url: 'https://github.com/mon99745/InfraReference.git'
        }

        build('demo', 8080)

    } catch (e) {
        currentBuild.result = 'FAILURE'
//        e.getStackTrace()
//        throw e
    } finally {
        String comment = """The CI/CD result is ${currentBuild.result}.
- Build: [${env.JOB_NAME}/${env.BUILD_NUMBER}](${env.JENKINS_URL}job/${env.JOB_NAME}/${env.BUILD_NUMBER}/flowGraphTable)
- Analyze: ${env.analyze}"""
        println comment
        addGitLabMRComment comment: comment
    }
}

void build(String moduleName, Integer port) {
    stage(moduleName) {
        if (env.STAGE_NAMES.contains(moduleName)) {
            try {
                build(moduleName)
                analyze(moduleName)
                deploy(moduleName, port)
                restart(moduleName)
            } finally {
                env.analyze += """[${moduleName}](http://10.10.40.157:9000/dashboard?id=${moduleName})
"""
            }
        }
    }
}

// 1. 빌드
void build(String moduleName) {
    if (env.STEP_NAMES.contains('build')
            || env.STEP_NAMES.contains('analyze')
            || env.STEP_NAMES.contains('test')
            || env.STEP_NAMES.contains('deploy')) {
        dir(getDirName(moduleName)) {
            bat "call build${getScriptModuleName(moduleName)}"
        }
    }
}

// 2. 정적분석 [단위테스트]
void analyze(String moduleName) {
    if (env.STEP_NAMES.contains('analyze')
            || env.STEP_NAMES.contains('test')) {
//        withSonarQubeEnv() {
        dir(getDirName(moduleName)) {
            String test = env.STEP_NAMES.contains('test') ? ' test' : ''
            bat "call sonar${getScriptModuleName(moduleName)}${test}"
        }
//        }
//        timeout(time: 2, unit: 'MINUTES') {
//            def qg = waitForQualityGate()
//            if (qg.status != 'OK') {
//                error "Pipeline aborted due to quality gate failure: ${qg.status}"
//            }
//        }
    }
}

// 3. 배포(재기동 포함)
void deploy(String moduleName, Integer port) {
    if (env.STEP_NAMES.contains('deploy')) {
        bat "call dkbuild ${getDockerModuleName(moduleName)}"
        bat "call dkrun ${getDockerModuleName(moduleName)} ${port}"
    }
}

// 재기동
void restart(String moduleName) {
    if (env.STEP_NAMES == 'restart') {
        bat "call dkrestart ${getDockerModuleName(moduleName)}"
    }
}
