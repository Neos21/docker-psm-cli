FROM python:3.8.0-alpine3.10

ARG username
ARG password
ARG identity_domain
ARG region
ARG data_center
ARG output_format

# プロキシ使用時は次のようにプロキシを指定する
#ENV http_proxy 【プロキシ URL:ポート】
#ENV https_proxy 【プロキシ URL:ポート】
#ENV HTTP_PROXY 【プロキシ URL:ポート】
#ENV HTTPS_PROXY 【プロキシ URL:ポート】

WORKDIR /root

RUN set -xe && \
    apk add --no-cache --update \
      curl && \
    pip install --upgrade pip && \
    curl -X GET \
         -u "${username}:${password}" \
         -H "X-ID-TENANT-NAME:${identity_domain}" \
         "https://${data_center}/paas/core/api/v1.1/cli/${identity_domain}/client" \
         -o psmcli.zip && \
    pip install -U psmcli.zip && \
    echo "{ \"username\": \"${username}\", \"password\": \"${password}\", \"identityDomain\": \"${identity_domain}\", \"region\": \"${region}\", \"outputFormat\": \"${output_format}\" }" > payload.json && \
    psm setup --config-payload payload.json && \
    rm psmcli.zip payload.json

ENTRYPOINT ["/usr/local/bin/psm"]
