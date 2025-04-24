pipeline {
  agent any
  stages {
    stage('scm checkout') {
      steps {
        git branch: 'master', url: 'https://github.com/NehaDaveMe/sample111project.git'
      }
    }


    stage('compile the job') //validate then compile
    {
      steps {
        withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
          sh 'mvn compile'
        }
      }
    }


    stage('execute unit test framework') {
      steps {
        withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
          sh 'mvn test'
        }
      }
    }
    stage('build the code') {
      steps {
        withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
          sh 'mvn clean package'
        }
      }
    }
    stage('create docker image') {
      steps {
        sh 'docker build -t nehadocker23/gitjenkindocker:latest .'
      }
    }
    stage('push docker image to dockerhub') {
      steps {
        
        withDockerRegistry(credentialsId: 'Dockerhub_cred', url: 'https://hub.docker.com/repositories/nehadocker23') {
        sh 'docker push nehadocker23/gitjenkindocker:latest'
}
        
      }
    }
  }
}
