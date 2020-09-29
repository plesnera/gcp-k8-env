# For the lazy a script that makes it easy to run the docker dev container locally with bind mounting of .ssh and .gcloud folders
# Should be run with the name of the container image as parameter referenced in $1 
docker run --rm -it -e CLOUDSDK_CONFIG=/config/mygcloud -v ~/.config/gcloud:/config/mygcloud \
-v /var/run/docker.sock:/var/run/docker.sock -v /Users/plesnera/yada/jenkins-x:/jx  -v ~/.ssh:/root/.ssh  --rm  $1
