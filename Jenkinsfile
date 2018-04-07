node {
  checkout scm

  stage('Create Docker Image') {
    dir('/home/admin/docker') {
      docker.build("docker-jenkins-pipeline:${env.BUILD_NUMBER}")
    }
  }

  stage ('Run Application') {
    try {
      sh "docker run -d -p 80:80 -p 443:443 docker-jenkins-pipeline:${env.BUILD_NUMBER}"

    } catch (error) {
    } finally {
      // Stop and remove database container here
      sh 'docker-compose stop $(docker ps -aq)'
      sh 'docker-compose rm $(docker ps -aq)'
    }
  }

  stage('Run Tests') {
    try {
      dir('/home/admin/docker') {
        docker.build("docker-jenkins-pipeline:${env.BUILD_NUMBER}").push()
      }
    } catch (error) {

    } finally {
      
    }
  }
}
