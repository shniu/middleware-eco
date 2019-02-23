
## Jenkins

> 演示项目: https://github.com/shniu/simple-java-maven-app

> Pipeline examples: https://github.com/jenkinsci/pipeline-examples

### Jenkins Pipeline

Jenkins Pipeline 是一套插件，将持续交付的实现和实施集成到 Jenkins 中。持续交付 Pipeline 自动化的表达了这样一种流程：**将基于版本控制管理的软件持续的交付到您的用户和消费者手中。** Jenkins Pipeline 定义在一个 `Jenkinsfile` 文件中。

一下是一些入门级的 Pipeline：

```
// https://jenkins.io/zh/doc/pipeline/tour/hello-world/
// Java
pipeline {
    agent { docker 'maven:3.3.3' }
    stages {
        stage('build') {
            steps {
                sh 'mvn --version'
            }
        }
    }
}

// Node
pipeline {
    agent { docker 'node:6.3' }
    stages {
        stage('build') {
            steps {
                sh 'npm --version'
            }
        }
    }
}
```

#### agent

`agent` 指令告诉 Jenkins 在哪里以及如何执行 Pipeline 或者 Pipeline 子集, 所有的 Pipeline 都需要 `agent`.

[agent](https://jenkins.io/doc/book/pipeline/syntax/#agent) 主要用来定义执行环境。

#### 环境变量

Jenkins 可以设置全局的和阶段 stage 的环境变量， 阶段性的环境变量只能在阶段定义的地方使用。

```
pipeline {
    agent any

    environment {
        DISABLE_AUTH = 'true'
        DB_ENGINE    = 'sqlite'
    }

    stages {
        stage('Build') {
            steps {
                sh 'printenv'
            }
        }
    }
}
```

环境变量的另一个用途是[凭证信息处理](https://jenkins.io/doc/book/pipeline/jenkinsfile/#handling-credentials), 需要[凭证信息配置](https://jenkins.io/doc/book/using/using-credentials/#configuring-credentials)

#### Parameters

提供了一个用户在触发流水线时应该提供的参数列表, 这些参数可以在执行 Job 之前指定，使构建过程更加的灵活。

如何使用 Parameters: https://st-g.de/2016/12/parametrized-jenkins-pipelines, 一般是在 Jenkinsfile 中使用，在执行任务前设置参数的值，可以在UI界面中设置。or  https://wiki.jenkins.io/display/JENKINS/Parameterized+Build

#### Controlling your build environment

[Controlling your build environment](https://github.com/jenkinsci/pipeline-model-definition-plugin/wiki/Controlling-your-build-environment) and https://github.com/jenkinsci/pipeline-model-definition-plugin/wiki

#### Pipeline steps

[Pipeline steps](https://jenkins.io/doc/pipeline/steps/) 里包含了大量的可用于声明式 Pipeline 中的插件, 总结几个常用的。

##### [sh](https://jenkins.io/doc/pipeline/steps/workflow-durable-task-step/#sh-shell-script)

sh 被用在类 Unix 系统中执行 shell 脚本或者 shell 命令，用法如下：

```
// 常规用法
sh 'echo "hello world"'
sh 'pwd'
sh 'java -version'
sh """
  mvn -version
  ls -al
  docker info
  dockr run hello-world
"""
sh './script/start.sh'

// 其他用法
steps {
    script {
        def v = sh(returnStdout: true, script: 'mvn help:evaluate -Dexpression=project.version | grep "^[^\\[]"').trim()
        print  v
    }
}

```

#### when 的使用

https://dingyuliang.me/jenkins-declarative-pipeline-use-conditional-stages/
https://github.com/cvitter/jenkins-pipeline-examples/blob/master/Jenkinsfile-When


### Ref

* https://github.com/vishwakarmarhl/jenkinstest/blob/master/Jenkinsfile
*   https://blog.sonatype.com/continuous-integration-in-pipeline-as-code-environment-with-jenkins-jacoco-nexus-and-sonarqube
*   https://github.com/infinityworks/sample-jenkins-pipeline-job
*   https://github.com/changdaye/jenkins-docker-demo
*   https://github.com/vishwakarmarhl/jenkinstest
*   maven https://www.jianshu.com/p/fd43b3d0fdb0
*   https://www.baeldung.com/maven-goals-phases
