FROM alpine:latest

RUN apk add --update --no-cache bash curl openssl \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/ \
    && curl -LO https://git.io/get_helm.sh \
    && chmod +x get_helm.sh \
    && ./get_helm.sh \
    && rm ./get_helm.sh \
    && mkdir -p ~/.kube \
    && touch ~/.kube/config
