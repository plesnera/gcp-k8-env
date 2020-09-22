# Docker and gitpod for work with google k8 
This repo contains a Dockerfile that extends the google/cloud-sdk with jq, kustomize (v.3.2.1), anthoscli, istioctl and jx.
To use the docker as dev environment with docker daemon in the container either use docker_run.sh that includes the following:
* environment variable (-e)  pointing to the location of your gcloud credentials
* bind mount of the location of your GCLOUD credentials, .ssh and docker daemon:
```
docker run --rm -it -e CLOUDSDK_CONFIG=/config/mygcloud -v ~/.config/gcloud:/config/mygcloud \\n-v /var/run/docker.sock:/var/run/docker.sock -v ~/.ssh:/root/.ssh  --name [CONTAINER NAME] --rm  [IMAGE NAME]
```  
