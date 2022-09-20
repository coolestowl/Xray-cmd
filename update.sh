if [ `id -u` -ne 0 ]
    then echo "please run as root"
    exit
fi

cd /Applications/V2rayU.app/Contents/Resources/

tag=`gh repo view XTLS/Xray-core --json latestRelease --jq .latestRelease.tagName`

echo "latest tag ${tag}"

wget -O v2ray-macos.zip https://github.com/XTLS/Xray-core/releases/download/${tag}/Xray-macos-arm64-v8a.zip

./unzip.sh

./install.sh

