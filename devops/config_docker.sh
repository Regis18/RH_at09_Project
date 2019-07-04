docker pull registry.jala.info/devops/alpine
docker pull registry.jala.info/devops/ubuntu

docker pull registry.jala.info/devops/jenkins/jenkins:2.150.3-alpine

cd /home/ubuntu
mkdir jenkins_home

docker run -p 80:8080 -p 50000:50000 -v /home/ubuntu/jenkins_home:/var/jenkins_home registry.jala.info/devops/jenkins/jenkins:2.150.3-alpine
