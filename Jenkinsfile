pipeline{
   agent any
  triggers{
      pollSCM '* * * * *'
  }
  stages{
    stage('checkout') 
    {
      steps 
      { 
        sh script: "echo 'this is just sample test'"
      }
    }
  }
}
        
