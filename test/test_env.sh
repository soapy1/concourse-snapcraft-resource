#!/usr/bin/env bash

# To test:
# docker run -it -v "$PWD":/test  sophiacastellarin/concourse-snapcraft-resource:latest bash

export SRC_DIR=$PWD
export BUILD_ID=1
export BUILD_NAME='my-build'
export BUILD_JOB_NAME='my-build-job'
export BUILD_PIPELINE_NAME='my-build-pipeline'
export ATC_EXTERNAL_URL='127.0.0.1/atc'

cat /test/test/test.json | /test/assets/check
cat /test/test/test.json | /test/assets/out
