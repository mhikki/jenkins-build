pipeline {
    agent {
        kubernetes {
            label 'docker-agent'
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: jnlp
    image: jenkins/inbound-agent:latest
    tty: true
  - name: docker
    image: docker:24-dind
    securityContext:
      privileged: true
    command:
    - dockerd-entrypoint.sh
    args:
    - "--host=tcp://0.0.0.0:2375"
    - "--host=unix:///var/run/docker.sock"
'''
        }
    }

    stages {
        stage('Check Docker') {
            steps {
                container('docker') {
                    sh 'docker --version'
                }
            }
        }

        stage('Build Image') {
            steps {
                container('docker') {
                    script {
                        app = docker.build("mhikki/nginx")
                    }
                }
            }
        }

        stage('Run Image') {
            steps {
                container('docker') {
                    script {
                        docker.image('mhikki/nginx').withRun('-p 80:80') { c ->
                            sh 'docker ps'
                            sh 'curl localhost'
                        }
                    }
                }
            }
        }
    }
}
