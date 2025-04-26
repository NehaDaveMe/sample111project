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
//     stage('create docker image ') {
//       steps {
//         sh 'docker build -t nehadocker23/gitjenkindocker:latest1 .'
//       }
//     }
//     stage('push docker image to dockerhub') {
//       steps {
        
//         withDockerRegistry(credentialsId: 'Dockerhub_cred', url: 'https://index.docker.io/v1/') {
//         sh 'docker push nehadocker23/gitjenkindocker:latest1'
// }
        
//       }
//     }

stage('Login to AWS ECR') {
            steps {
                script {
                    // Authenticate Docker to AWS ECR
                    sh """
                        aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 730335269916.dkr.ecr.ap-south-1.amazonaws.com
                    """
                }
            }
        }
stage('Build Docker Image ') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t awsecr .'
                }
            }
        }

        stage('Tag Docker Image for ECR') {
            steps {
                script {
                    // Tag the Docker image for AWS ECR
                    sh """
                        docker tag awsecr:latest 730335269916.dkr.ecr.ap-south-1.amazonaws.com/awsecr:latest
                    """
                }
            }
        }

        stage('Push Docker Image to ECR') {
            steps {
                script {
                    // Push the Docker image to ECR
                    sh """
                        docker push 730335269916.dkr.ecr.ap-south-1.amazonaws.com/awsecr:latest
                    """
                }
            }
        }
    }
  }

