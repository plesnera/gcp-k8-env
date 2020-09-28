FROM google/cloud-sdk

WORKDIR /usr
RUN curl -o bin/kustomize -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.2.1/kustomize_kustomize.v3.2.1_linux_amd64 &&\
	chmod 755 bin/kustomize
RUN curl -o bin/yq  -L https://github.com/mikefarah/yq/releases/download/3.2.3/yq_linux_386 && chmod 755 bin/yq
RUN curl -OL https://github.com/jenkins-x/jx-cli/releases/download/v3.0.316/jx-cli-linux-amd64.tar.gz && tar -xf jx-cli-linux-amd64.tar.gz -C bin && chmod 755 bin/jx
WORKDIR /tmp
RUN curl -OL https://storage.googleapis.com/gke-release/asm/istio-1.4.10-asm.15-linux.tar.gz && tar -xf istio-1.4.10-asm.15-linux.tar.gz -C /opt && ln -s /opt/istio-1.4.10-asm.15/bin/* -t /usr/bin/
RUN chmod 755 /usr/bin/* 
WORKDIR ~
RUN export PATH=$PATH:/usr/bin
