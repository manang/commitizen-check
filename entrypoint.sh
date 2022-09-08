#!/bin/bash

set -e


PIP_CMD=('pip' 'install')
if [[ $INPUT_COMMITIZEN_VERSION == 'latest' ]]; then
  PIP_CMD+=('commitizen')
else
  PIP_CMD+=("commitizen==${INPUT_COMMITIZEN_VERSION}")
fi

"${PIP_CMD[@]}"
echo "Commitizen version: $(cz version)"

CZ_CMD=('cz check')
echo "${CZ_CMD[@]}"
"${CZ_CMD[@]}"
echo "Done."