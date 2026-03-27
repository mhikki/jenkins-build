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

}
}

