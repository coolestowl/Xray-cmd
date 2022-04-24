cd /Applications/V2rayU.app/Contents/Resources/

tag=`gh repo view XTLS/Xray-core --json latestRelease --jq .latestRelease.tagName`

echo "latest tag ${tag}"

wget -O Xray-macos-64.zip https://github.com/XTLS/Xray-core/releases/download/${tag}/Xray-macos-arm64-v8a.zip

./unzip.sh

./install.sh

