FROM google/cloud-sdk

WORKDIR /usr/local
RUN curl -o bin/kustomize -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.2.1/kustomize_kustomize.v3.2.1_linux_amd64 &&\
	chmod 777 /usr/local/bin/kustomize
RUN curl -o bin/yq  -L https://github.com/mikefarah/yq/releases/download/3.2.3/yq_linux_386 && chmod 777 bin/yq
RUN curl -OL https://github.com/jenkins-x/jx-cli/releases/download/v3.0.316/jx-cli-linux-amd64.tar.gz && tar -xf jx-cli-linux-amd64.tar.gz -C bin && chmod 777 bin/jx
WORKDIR /tmp
RUN curl -LO https://storage.googleapis.com/gke-release/asm/istio-1.4.10-asm.15-linux.tar.gz && tar -xf istio-1.4.10-asm.15-linux.tar.gz -C /opt && ln -s /opt/istio-1.4.10-asm.15/bin/* -t /usr/local/bin/
WORKDIR ~
RUN export PATH=$PATH:/usr/local/bin
VOLUME ["/root/.config"]
ENTRYPOINT ["/bin/bash"]
