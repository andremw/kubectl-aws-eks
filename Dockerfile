FROM alpine:3.13

ARG KUBECTL_VERSION="1.17.7"

RUN apk add py-pip curl wget ca-certificates git bash jq gcc alpine-sdk
RUN pip install 'awscli==1.20.8'
RUN curl -L -o /usr/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.7/2020-07-08/bin/linux/amd64/kubectl
RUN chmod +x /usr/bin/kubectl

RUN curl -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.7/2020-07-08/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/bin/aws-iam-authenticator

RUN kubectl version --client
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
