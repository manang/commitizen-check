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
echo "!!!${GITHUB_BASE_REF}"
echo "cz check --rev-range origin/${GITHUB_BASE_REF}.."
cz check --rev-range origin/${GITHUB_BASE_REF}..
echo "Done."