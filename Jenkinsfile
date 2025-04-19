pipeline {
    agent any
    stages {
        stage('SCM checkout') {
            steps {
                git 'https://github.com/NehaDaveMe/sample111project.git'
            }
        }
        stage('packaging the code') {
            steps {
                withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) 
                {
                sh 'mvn package'
                }
            }
        }
        stage('deploy the code on tomcate server') {
      steps {
        sshagent(['dev']) {
        sh 'scp -o StrictHostKeyChecking=no webapp/target/webapp.war ec2-user@65.0.179.225:/usr/share/tomcat/webapps'
        }
      }
      }
    }
}