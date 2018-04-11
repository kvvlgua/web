node {
  deleteDir()
  stage('Clear') {
   deleteDir() 
  }
  stage('Create Docker Image') {
    checkout scm
    sh "git remote add web https://github.com/kvvlgua/web.git"
    sh "git pull web master"
    sh "docker stop web"
    sh "docker rm web"
    sh "docker image rm -f web"
    sh "docker build -f Dockerfile -t web ./"
  }

  stage ('Run Application') {
    try {

      sh "docker run -d -p 80:80 -p 443:443 web"

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
