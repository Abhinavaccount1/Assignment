pipeline {
    agent any
    
    stages {
        stage('Clean Compile') {
            steps {
                
                sh "mvn clean compile"

            }
        }
        stage('Test') {
            steps {
                
                sh "mvn test"

            }
        }
        
        stage('Install') {
            steps {
                
                sh "mvn install"

            }
        }
        
/*        stage('Quality Gate Stutus Check') {
            steps {
                
                script{
                    withSonarQubeEnv('sonarqube'){
                        sh "mvn sonar:sonar"
                    }
                }

            }
        }
        
         stage ('Artifactory Configuration') {
            steps {
                rtServer (
                    id: "Artifactory",
                    url: "http://192.168.56.108:8081/artifactory",

               )

               rtMavenResolver (
                    id: 'maven-resolver',
                    serverId: 'Artifactory',
                    releaseRepo: 'libs-release',
                    snapshotRepo: 'libs-snapshot'
                )  
                 
                rtMavenDeployer (
                    id: 'maven-deployer',
                    serverId: 'Artifactory',
                    releaseRepo: 'libs-release-local',
                    snapshotRepo: 'libs-snapshot-local'
                )
            }
        }
            
        stage('upload') {
           steps {
              script {
                 def server = Artifactory.server 'Artifactory'
                 def uploadSpec = """{
                    "files": [{
                       "pattern": "/var/lib/jenkins/workspace/First_Pipeline_Job/target/*.war",
                       "target": "libs-snapshot-local"
                    }]
                 }"""
                server.upload(uploadSpec)
               }
            }
        }
       stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "Artifactory"
                )
            }
        }
*/        
        stage('Build docker image'){
            steps{
                script{
                    sh 'sudo -n docker build -t calc .'
                }
            }
        }

        stage ('Publish to ECR') {
      steps {

        sh 'docker login -u AWS https://876724398547.dkr.ecr.ap-northeast-1.amazonaws.com -p "$(aws ecr get-login-password --region ap-northeast-1)"'
          
          sh 'docker tag calc:latest 876724398547.dkr.ecr.ap-northeast-1.amazonaws.com/ecr_repository:latest'
          
          sh 'docker push 876724398547.dkr.ecr.ap-northeast-1.amazonaws.com/ecr_repository:latest'
          }
          }
          
/*        stage ('EC2 Start') {
        steps {
            withAWS(credentials: 'aws-cred', endpointUrl: 'https://ec2-54-250-247-94.ap-northeast-1.compute.amazonaws.com/', region: 'ap-northeast-1') {
                sh 'aws ec2 start-instances --instance-ids  i-0a1442b147d4dfec2'
                sh 'echo Instance  i-0a1442b147d4dfec2 Started'
}
}
}

        stage('EC2 Deploy') {
         steps {
         script {
           sh 'ssh "-o StrictHostKeyChecking=no" -i "/opt/key.pem" ec2-user@18.183.53.247  sudo docker login -u AWS https://876724398547.dkr.ecr.ap-northeast-1.amazonaws.com -p "$(aws ecr get-login-password --region ap-northeast-1)" '
           sh 'ssh "-o StrictHostKeyChecking=no" -i "/opt/key.pem" ec2-user@18.183.53.247  sudo systemctl start docker '
           sh 'ssh "-o StrictHostKeyChecking=no" -i "/opt/key.pem" ec2-user@18.183.53.247 sudo docker pull 876724398547.dkr.ecr.ap-northeast-1.amazonaws.com/ecr_repository:latest'
           sh 'ssh "-o StrictHostKeyChecking=no" -i "/opt/key.pem" ec2-user@18.183.53.247  sudo docker run -p 8087:8080 876724398547.dkr.ecr.ap-northeast-1.amazonaws.com/ecr_repository:latest'
               }
         } 
      }
      */
}}
