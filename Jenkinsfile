node{
  def app
  
    stage('clone') {
    }
   stage('Build image') {
         app = docker.build("mhikki/nginx")
    }
    stage('Run image') {
	docker.image('mhikki/nginx'.withRun('-p 80:80') { c ->

        sh 'docker ps'
        sh 'curl localhost'
       }
    }
}
