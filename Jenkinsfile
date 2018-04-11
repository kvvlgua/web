node {
  deleteDir()
  stage('Clear') {
   deleteDir() 
  }
  stage('Create Docker Image') {
    checkout scm
    sh "git remote add web https://github.com/kvvlgua/web.git"
    sh "git pull web master"
    sh "docker stop $(docker ps -aq)"
    sh "docker rm $(docker ps -aq)"
    sh "docker image rm -f web:${env.BUILD_NUMBER}-1"
    sh "docker build -f Dockerfile -t web:${env.BUILD_NUMBER} ./"
  }

  stage ('Run Application') {
    try {

      sh "docker run -d -p 80:80 -p 443:443 web:${env.BUILD_NUMBER}"

    } catch (error) {
    } finally {
      
    }
  }

  stage('Run Tests') {
    try {
       docker.build("docker-jenkins-pipeline:${env.BUILD_NUMBER}", "https://github.com/web/blob/master/Dockerfile").push()
    } catch (error) {

    } finally {
      
    }
  }
}
