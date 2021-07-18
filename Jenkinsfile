pipeline {
	agent any
		tools{
		maven 'Maven'
		}
	stages{
		stage('Intial')
		{
		steps{
		echo "Job started"
			}
		}
		stage('clean')
		{
			steps{
				cleanWs()
		}
		}
	
		stage('Git')
		{
		steps{
		git branch: 'samp', credentialsId: 'b1416bb9-0629-4ef3-a4a2-39cacc1b28a9', url: 'https://github.com/github-ven/Jenk.git'
			}
		}
		stage('build')
		{
		steps{
		sh script: 'mvn clean install'
			}
		}
		stage('Archive arttifact')
		{
		steps{
		archiveArtifacts artifacts: '**/target/*.war', fingerprint: true, followSymlinks: false, onlyIfSuccessful: true		
			}
		}
		stage('Nexus uploader')
		{
		steps{
		nexusArtifactUploader artifacts: [[artifactId: 'webappRunnerSample', classifier: '', file: 'target/webappRunnerSample-1.0-SNAPSHOT.war', type: 'war']], credentialsId: 'nexususer', groupId: 'com.heroku.sample', nexusUrl: '192.168.13.128:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'devops', version: '1.1'
			}
		}
		
	}
}
