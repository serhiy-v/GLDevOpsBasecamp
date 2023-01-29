#!/bin/bash

create_admin_user() {
    sudo -u jenkins mkdir /var/lib/jenkins/init.groovy.d
    sudo -u jenkins touch /var/lib/jenkins/init.groovy.d/create-admin.groovy
    sudo chmod 666 /var/lib/jenkins/init.groovy.d/create-admin.groovy

    sudo echo "
    import jenkins.model.*
    import hudson.security.*

    def instance = Jenkins.getInstance()

    def hudsonRealm = new HudsonPrivateSecurityRealm(false)
    hudsonRealm.createAccount('admin','admin')
    instance.setSecurityRealm(hudsonRealm)

    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    instance.setAuthorizationStrategy(strategy)

    instance.save() " > /var/lib/jenkins/init.groovy.d/create-admin.groovy

    sudo systemctl restart jenkins
}

install_plugins(){
    curl -O http://localhost:8080/jnlpJars/jenkins-cli.jar

    declare  -a PluginList=(
        "github"
        "git" 
        "workflow-aggregator"
        "github-branch-source"
        "pipeline-stage-view"
        "blueocean"
        "Locale"
        "Publish-Over-SSH"
        "Multibranch-Scan-Webhook-Trigger"
        "Telegram-Notifications"
    )

    for plugin in ${PluginList[@]}; do
        java -jar jenkins-cli.jar -auth admin:admin -s http://localhost:8080/ install-plugin $plugin

    done

    sudo systemctl restart jenkins
}

sudo apt update
sudo apt install -y openjdk-11-jre 

sudo apt install -y curl

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install -y jenkins

sudo chmod 666 /etc/default/jenkins
sudo echo 'JAVA_ARGS="-Djenkins.install.runSetupWizard=false"' >> /etc/default/jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins

if [ ! -d "/var/lib/jenkins/init.groovy.d" ]; 
then
        create_admin_user
        install_plugins
else
        echo "Groovy scripts already exists!"
fi
