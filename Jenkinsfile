node {
  checkout scm

  stage('Create Docker Image') {
          sh "login admin"
          sh "cd /home/admin/docker/web"
          sh "git pull web master"
    docker.build("docker-jenkins-pipeline:${env.BUILD_NUMBER}", "/home/admin/docker/web")
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
