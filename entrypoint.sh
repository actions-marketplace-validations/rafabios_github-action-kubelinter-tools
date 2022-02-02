#!/bin/sh

CMDLINE=""

if [ ! -z $INPUT_CONFIG_FILE ]; then
  CMDLINE="${CMDLINE} --config ${INPUT_CONFIG_FILE}"
fi

if [ ! -z $INPUT_ENABLE_ALL ]; then
  CMDLINE="${CMDLINE} --add-all-built-in"
fi

if [ ! -z $INPUT_NO_DEFAULTS ]; then
  CMDLINE="${CMDLINE} --do-not-auto-add-defaults"
fi

if [ ! -z $INPUT_EXCLUDE ]; then
  CMDLINE="${CMDLINE} --exclude ${INPUT_EXCLUDE}"
fi

if [ ! -z $INPUT_FORMAT ]; then
  CMDLINE="${CMDLINE} --format ${INPUT_FORMAT}"
fi

if [ ! -z $INPUT_INCLUDE ]; then
  CMDLINE="${CMDLINE} --exclude ${INPUT_INCLUDE}"
fi

if [ ! -z $INPUT_VERBOSE ]; then
  CMDLINE="${CMDLINE} --verbose"
fi

# Yup not the cleanest but prevent to add more deps to the image
grep 'PRETTY_NAME' /etc/os-release | cut -d'=' -f2 | sed  's/"//g'
LINTER_VERSION=$(kube-linter version)
echo "kube-linter ${LINTER_VERSION}"

kube-linter lint ${CMDLINE} ${INPUT_FILE_OR_DIR}
