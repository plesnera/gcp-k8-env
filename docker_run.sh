docker run --rm -it -e CLOUDSDK_CONFIG=/config/mygcloud -v ~/.config/gcloud:/config/mygcloud \
-v /var/run/docker.sock:/var/run/docker.sock -v /Users/plesnera/yada/jenkins-x:/jx  -v ~/.ssh:/root/.ssh  --rm  gcloud-k8
