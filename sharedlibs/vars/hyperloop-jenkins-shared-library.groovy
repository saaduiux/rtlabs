// def changelog() {
//     dir("changelog/")
//     sh 'pip3 install -r requirements'
//     sh 'python3 docker_changelog.py --report ${JENKINS_HOME}/jobs/${JOB_NAME}/build/${BUILD_NUMBER}/archive/qualys_images_summary.json --image ${JOB_NAME}'
// }

def changelog() {
    echo "this is ${BUILD_NUMBER}"
}