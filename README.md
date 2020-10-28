# Docker and gitpod for work with google k8 
This repo contains a Dockerfile that extends the google/cloud-sdk with jq, kustomize (v.3.2.1), anthoscli, istioctl, jx and K9S.
To use the docker as dev environment with docker daemon in the container use docker_run.sh which runs your image with:
* environment variable (-e)  pointing to the location of your gcloud credentials
* bind mount of the location of your GCLOUD credentials, .ssh and docker daemon:
```  
./docker_run.sh [IMAGE NAME]
```  
