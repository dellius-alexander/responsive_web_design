///////////////////////////////////////////////////////////////////////////////
pipeline {
    agent any
    stages {
        sh 'echo "Starting Test......"'
        sh ''' 
################################################################
################################################################
RED=\'\\033[0;31m\' # Red
NC=\'\\033[0m\' # No Color CAP
source $(find . -type f -iname \'project.env\') 2>/dev/null
__KUBECTL__=$(command -v kubectl)
__DOCKER__=$(command -v docker)
################################################################
        
        '''
        sh '''
################################################################
function __remove_repo__(){
################################################################
if [[ $(ls -lia | grep -c Testing-Strategy)  != 0 ]]; then
        rm -rf  Testing-Strategy
    #
    wait $!
    #
    printf "\\nFound old copy of Testing-Strategy in workspace...\\n"
    printf "\\nDeleted...old version of Testing-Strategy...\\n\\n"
fi
################################################################
}
################################################################
################################################################
function __remove_cntr__(){
################################################################
[[ $(find . -type d -iname \'www.Dockerfile\' | grep -c Testing-Strategy) == 0 ]] \\
&& git clone ${PROJECT_REPO_MAIN} && wait $!
#
# Docker build ...
#
printf "\nBuilding Webserver docker image...\n\n"
#
docker build -t dalexander2israel/www_hyfi:v3 -f www.Dockerfile . 
#
wait $!
#
fi
#
echo "Build completed......"
'''
    }

}
///////////////////////////////////////////////////////////////////////////////