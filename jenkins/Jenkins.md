
## Jenkins

> 演示项目: https://github.com/shniu/simple-java-maven-app

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

### Ref

* https://github.com/vishwakarmarhl/jenkinstest/blob/master/Jenkinsfile
*   https://blog.sonatype.com/continuous-integration-in-pipeline-as-code-environment-with-jenkins-jacoco-nexus-and-sonarqube
*   https://github.com/infinityworks/sample-jenkins-pipeline-job
*   https://github.com/changdaye/jenkins-docker-demo
*   https://github.com/vishwakarmarhl/jenkinstest
*   maven https://www.jianshu.com/p/fd43b3d0fdb0
*   https://www.baeldung.com/maven-goals-phases
