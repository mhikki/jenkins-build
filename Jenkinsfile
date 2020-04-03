node{
  def app
  
    stage('clone') {
        # checkout scm
        
    }
   stage('Build image') {
         app = docker.build("mhikki/nginx")
    }
    stage('Run image') {
	docker.image('mhikki/nginx').withRun('-p 80:80') { c ->

        sh 'docker ps'
        sh 'curl localhost'
       }
    }
}
