  
pipeline{
    agent any
    environment {
        // DOCKER_CERT_PATH is automatically picked up by the Docker client
        // Usage: $DOCKER_CERT_PATH or $DOCKER_CERT_PATH_USR or $DOCKER_CERT_PATH_PSW
        DOCKER_CERT_PATH = credentials('PRIVATE_CNTR_REGISTRY')
    }
    stages {
        stage('Build Test Images...'){
            parallel { // parallel build stages
                stage('Parallel Build Webserver Image'){
                    steps {
                        script {
                            def www_image
                            def www_dockerfile
                            try{
                                www_dockerfile = 'www.Dockerfile'
                                www_image = docker.build("hyfi_webserver:${env.BUILD_ID}", "-f ${www_dockerfile} .")
                                //////////////////////
                                // Push image to repo                               
                                sh '''
                                docker login -u $DOCKER_CERT_PATH_USR -p $DOCKER_CERT_PATH_PSW registry.dellius.app;
                                docker tag hyfi_webserver:${BUILD_ID} registry.dellius.app/hyfi_webserver:v1.19.3;
                                docker push registry.dellius.app/hyfi_webserver:v1.19.3;
                                echo "Intermediate build success......;"
                                '''
                            }
                            catch(e){
                                sh '''
                                echo "Intermediate build failure......";
                                '''
                                throw e
                            }
                            cleanWs() // clean up workspace post-build
                        } // End of script block
                    } // End of Steps
                } // End of stage()
            } // End of parallel build stages
        } // End of Build Test images stage()
    } // End of Main stages
}

// // This Jenkinsfile defines the dockerfile that will be used to build an image, that will run as a container in the "stages" to test if our webservice files were copied into our image.
// pipeline {
//     agent { // Define the dockerfile parameters to build and run container
//         dockerfile {
//             filename 'www.Dockerfile'
//             label 'master'
//             registryUrl 'https://index.docker.io/v1/'
//             registryCredentialsId 'Docker_Hub_Credentials'
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