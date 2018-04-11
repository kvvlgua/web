node {
  deleteDir()
  stage('Clear') {
   deleteDir() 
  }
  stage('Create Docker Image') {
    checkout scm
    docker.build("docker-jenkins-pipeline:${env.BUILD_NUMBER}", "")
  }

  stage ('Run Application') {
    try {

      sh "docker run -d -p 80:80 -p 443:443 docker-jenkins-pipeline:${env.BUILD_NUMBER}"

    } catch (error) {
    } finally {
      
    }
  }

  stage('Run Tests') {
    try {
       docker.build("docker-jenkins-pipeline:${env.BUILD_NUMBER}", "/home/admin/docker/web").push()
    } catch (error) {

    } finally {
      
    }
  }
}
