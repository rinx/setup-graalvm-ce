#!/bin/sh

set -e
GRAALVM_VERSION=$1
JAVA_VERSION=$2
NATIVE_IMAGE_ENABLED=$3
TMP_GRAALVM_HOME=/github/home/graalvm
GRAALVM_HOME=/home/runner/work/_temp/_github_home/graalvm

echo "Install GRAALVM $GRAALVM_VERSION $JAVA_VERSION"

GRAALVM_TGZ_URI="https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-${JAVA_VERSION}-linux-amd64-${GRAALVM_VERSION}.tar.gz"

curl -sL $GRAALVM_TGZ_URI --output graalvm.tar.gz

mkdir -p $TMP_GRAALVM_HOME
tar -xf graalvm.tar.gz -C $TMP_GRAALVM_HOME --strip-components=1
chmod -R a+rwx $TMP_GRAALVM_HOME

if [ "$NATIVE_IMAGE_ENABLED" = "true" ]; then
    echo "Install native-image"
    $TMP_GRAALVM_HOME/bin/gu install native-image
fi

echo "${GRAALVM_HOME}/bin" >> $GITHUB_PATH
echo "GRAALVM_HOME=${GRAALVM_HOME}" >> $GITHUB_ENV
echo "JAVA_HOME=${GRAALVM_HOME}" >> $GITHUB_ENV
echo "GRAALVM_VERSION=${GRAALVM_VERSION}" >> $GITHUB_ENV
