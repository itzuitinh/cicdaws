# install jenkins
1. EC2 installation
2. Java installation
$ yum install -y java-1.8.0-openjdk-devel.x86_64
$ alternatives --config java
$ java -version

3. Jenkins install
$ wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
$ rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
$ yum install -y jenkins

4. Start Jenkins
$ systemctl start jenkins

5. Setting password
$ less /var/lib/jenkins/secrets/initialAdminPassword
