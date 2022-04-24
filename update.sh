cd /Applications/V2rayU.app/Contents/Resources/

gh repo view XTLS/Xray-core --json latestRelease --jq .latestRelease.tagName

wget -O Xray-macos-64.zip https://github.com/XTLS/Xray-core/releases/download/`gh repo view XTLS/Xray-core --json latestRelease --jq .latestRelease.tagName`/Xray-macos-arm64-v8a.zip

./unzip.sh

./install.sh

