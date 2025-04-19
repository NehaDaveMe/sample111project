pipeline {
    agent any
    stages {
        stage('SCM checkout') {
            steps {
                git 'https://github.com/NehaDaveMe/sample111project.git'
            }
        }
        stage('compile the code') {
            steps {
                withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) 
                {
                sh 'mvn compile'
                }
            }
        }
        stage('Unit test framework implemenation') {
            steps {
                withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) 
                {
                sh 'mvn test'
                }
            }
        }
    }
}