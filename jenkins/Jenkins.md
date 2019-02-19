
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

