#!/bin/bash

#set -x

CURL_PROXY_FLAG=""
CURL="curl -sL ${CURL_PROXY_FLAG}"
JQ="gojq -r"

function get_latest_tag {
    echo `${CURL} https://api.github.com/repos/$1/releases/latest | ${JQ} .tag_name`
}

function github_release_url {
    echo "https://github.com/$1/releases/download/$2"
}

function clash {
    repo="Dreamacro/clash"

    tag=`get_latest_tag ${repo}`
    binary_name="clash-linux-amd64-${tag}"
    file_name="${binary_name}.gz"
    url_prefix=`github_release_url ${repo} ${tag}`

    ${CURL} ${url_prefix}/${file_name} > ${file_name}
    shasum -a 256 ${file_name}

    gzip -d ${file_name}

    chmod +x ${binary_name}
    mv ${binary_name} clash
}

function cproxy {
    repo="NOBLES5E/cproxy"

    tag=`get_latest_tag ${repo}`
    file_name="cproxy_${tag}_x86_64-unknown-linux-musl.zip"
    url_prefix=`github_release_url ${repo} ${tag}`

    shasum_name="${file_name}.sha256sum"

    ${CURL} ${url_prefix}/${file_name} > ${file_name}
    ${CURL} ${url_prefix}/${shasum_name} > ${shasum_name}

    shasum -a 256 ${file_name}
    cat ${shasum_name}

    unzip -o ${file_name} cproxy
    rm ${file_name} ${shasum_name}
}

function tuic_server {
    repo="EAimTY/tuic"

    tag=`get_latest_tag ${repo}`
    file_name="tuic-server-${tag}-x86_64-linux-musl"
    url_prefix=`github_release_url ${repo} ${tag}`

    shasum_name="${file_name}.sha256sum"

    ${CURL} ${url_prefix}/${file_name} > ${file_name}
    ${CURL} ${url_prefix}/${shasum_name} > ${shasum_name}

    shasum --check ${shasum_name}

    chmod +x ${file_name}
    mv ${file_name} tuic-server

    rm ${shasum_name}
}

apt update && apt install -y tmux gojq

clash
cproxy
tuic_server
