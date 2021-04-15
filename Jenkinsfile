pipeline {
    agent { // Define the dockerfile parameters to build and run container
        dockerfile {
            filename 'www.Dockerfile'
            label 'master'
            registryUrl 'https://index.docker.io/v1/'
            registryCredentialsId '__DOCKER_REGISTRY_SECRETS__'
            // args '-v ./docs:/usr/share/nginx/html'
        }
    }

    stages{
        stage('Test') {
            steps {
                echo 'Validating Responsive Web Design Repo...'
                sh 'ls -al /usr/share/nginx/html | grep -i "index.html"'
            }          
        }
        // stage('Build Hyfi Web App Image') {
        //     steps {
        //         echo 'Building image...'
        //         dockerfile
        //     }
        // }
    }
}











///////////////////////////////////////////////////////////////////////////////
// pipeline {
//     agent any
//     stages {
//         sh 'echo "Starting Test......"'
//         sh ''' 
// ################################################################
// ################################################################
// RED=\'\\033[0;31m\' # Red
// NC=\'\\033[0m\' # No Color CAP
// source $(find . -type f -iname \'project.env\') 2>/dev/null
// __KUBECTL__=$(command -v kubectl)
// __DOCKER__=$(command -v docker)
// ################################################################
        
//         '''
//         sh '''
// ################################################################
// function __remove_repo__(){
// ################################################################
// if [[ $(ls -lia | grep -c Testing-Strategy)  != 0 ]]; then
//         rm -rf  Testing-Strategy
//     #
//     wait $!
//     #
//     printf "\\nFound old copy of Testing-Strategy in workspace...\\n"
//     printf "\\nDeleted...old version of Testing-Strategy...\\n\\n"
// fi
// ################################################################
// }
// ################################################################
// ################################################################
// function __remove_cntr__(){
// ################################################################
// [[ $(find . -type d -iname \'www.Dockerfile\' | grep -c Testing-Strategy) == 0 ]] \\
// && git clone ${PROJECT_REPO_MAIN} && wait $!
// #
// # Docker build ...
// #
// printf "\nBuilding Webserver docker image...\n\n"
// #
// docker build -t dalexander2israel/www_hyfi:v3 -f www.Dockerfile . 
// #
// wait $!
// #
// fi
// #
// echo "Build completed......"
// '''
//     }

// }
///////////////////////////////////////////////////////////////////////////////