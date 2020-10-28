FROM google/cloud-sdk

WORKDIR /usr
RUN curl -o bin/kustomize -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.2.1/kustomize_kustomize.v3.2.1_linux_amd64 &&\
	chmod 755 bin/kustomize
RUN curl -o bin/yq  -L https://github.com/mikefarah/yq/releases/download/3.2.3/yq_linux_386 && chmod 755 bin/yq
RUN curl -OL https://github.com/jenkins-x/jx-cli/releases/download/v3.0.316/jx-cli-linux-amd64.tar.gz && tar -xf jx-cli-linux-amd64.tar.gz -C bin && chmod 755 bin/jx
RUN curl --silent -L  https://github.com/kubeflow/kfctl/releases/download/v1.1-rc.1/kfctl_v1.1-rc.1-0-g3e61b81_linux.tar.gz | tar xz -C bin
RUN curl -OL https://github.com/derailed/k9s/releases/download/v0.22.1/k9s_Linux_x86_64.tar.gz && tar -xzf k9s_Linux_x86_64.tar.gz -C bin

WORKDIR /tmp
RUN curl -LO https://storage.googleapis.com/gke-release/asm/istio-1.4.10-asm.15-linux.tar.gz && tar -xf istio-1.4.10-asm.15-linux.tar.gz -C /opt && ln -s /opt/istio-1.4.10-asm.15/bin/* -t /usr/bin
RUN chmod 755 /usr/bin/*
WORKDIR ~
RUN export PATH=$PATH:/usr/bin
ENTRYPOINT ["/bin/bash"]
