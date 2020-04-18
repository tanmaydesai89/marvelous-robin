#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e9ab2b40907710019132d11/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e9ab2b40907710019132d11
curl -s -X POST https://api.stackbit.com/project/5e9ab2b40907710019132d11/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e9ab2b40907710019132d11/webhook/build/publish > /dev/null
