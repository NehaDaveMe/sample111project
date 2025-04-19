pipeline {
    agent any
    stages {
        stage('SCM checkout') {
            steps {
                git 'https://github.com/NehaDaveMe/sample111project.git'
            }
        }
        stage('validate the code') {
            steps {
                withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) 
                {
                sh 'mvn validate'
                }
            }
        }
    }
}