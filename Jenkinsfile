  
pipeline{
    agent any
    environment {
        // DOCKER_CERT_PATH is automatically picked up by the Docker client
        // Usage: $DOCKER_CERT_PATH or $DOCKER_CERT_PATH_USR or $DOCKER_CERT_PATH_PSW
        DOCKER_CERT_PATH = credentials('PRIVATE_CNTR_REGISTRY')
        BUILD_RESULTS="failure"
    }
    stages {
        stage('Build Webserver Image'){
            steps {
                script {
                    // Define some variables
                    def www_image
                    def www_dockerfile
                    try{ // try and catch errors
                        // Test environment...
                        sh '''
                        ls -lia;
                        env;
                        '''
                        // name the dockerfile
                        www_dockerfile = 'www.Dockerfile'
                        www_image = docker.build("hyfi_webserver:${env.BUILD_ID}", "-f ${www_dockerfile} .")
                        // Login to private container registry:
                        //   - [ registry.dellius.app ]                  
                        sh '''
                        docker login -u $DOCKER_CERT_PATH_USR -p $DOCKER_CERT_PATH_PSW registry.dellius.app;
                        '''
                        // tag the webserver image to private repository
                        sh '''
                        docker tag hyfi_webserver:${BUILD_ID} registry.dellius.app/hyfi_webserver:v1.19.3;
                        '''
                        // Push image to private container registry
                        sh '''
                        docker push registry.dellius.app/hyfi_webserver:v1.19.3;
                        echo "Intermediate build success......;"
                        export BUILD_RESULTS="success";
                        '''
                    }
                    catch(e){
                        sh '''
                        echo "Intermediate build failure......";
                        export BUILD_RESULTS="failure";
                        '''
                        throw e
                    }
                    cleanWs() // clean up workspace post-Build
                } // End of script block
            } // End of Steps
        } // End of Build Test images stage()
        stage('Testing image hyfi_webserver:v1.19.3'){ // Testing stage()
            agent {
                docker { image 'registry.dellius.app/hyfi_webserver:v1.19.3'}
            }
            steps{
                script{
                    try{
                        sh '''
                        ls -lia /usr/share/nginx/html
                        export BUILD_RESULTS="success";
                        '''
                    }
                    catch(e){
                        sh '''
                        echo "Intermediate build failure......";
                        export BUILD_RESULTS="failure";
                        '''
                        throw e
                    }
                    cleanWs() // clean up workspace post-Testing
                }
            }
        } // End of Testing stage()
        stage('Deploy Webservice to Cloud...'){
            when {
                environment name: 'BUILD_RESULTS', value: 'failure'
            }
            steps('Deploy Webservice to Cloud...'){
                script{
                    try{
                        sh '''
                        git clone https://github.com/dellius-alexander/responsive_web_design.git;
                        cd responsive_web_design;
                        kubectl apply -f hyfi-k8s-deployment.yaml;
                        export BUILD_RESULTS="success";
                        '''                        
                    }
                    catch(e){
                        sh '''
                        echo "Intermediate build failure......";
                        export BUILD_RESULTS="failure";
                        '''
                        throw e
                    }
                    cleanWs() // clean up workspace post-Deploy
                }
            }            
        } // End of Deploy to Prod stage()
    } // End of Main stages
}

// // This Jenkinsfile defines the dockerfile that will be used to build an image, that will run as a container in the "stages" to test if our webservice files were copied into our image.
// pipeline {
//     agent { // Define the dockerfile parameters to build and run container
//         dockerfile {
//             filename 'www.Dockerfile'
//             label 'master'
//             registryUrl 'https://registry.dellius.app/'
//             registryCredentialsId '${DOCKER_CERT_PATH}'
//         }
//     }
//     stages{
//         stage('Test') { // Checking container for presence of copied files
//             steps {
//                 sh '''if [ $(ls -lia /usr/share/nginx/html | grep -ic "index") -eq 0 ]; then
//                 echo "Project files failed to be copied to image...";
//                 exit 1;
//                 else
//                 echo "Project files successfully copied to image...";
//                 ls -lia /usr/share/nginx/html;
//                 fi;
//                 '''
//             }
//         }
//     }
// }