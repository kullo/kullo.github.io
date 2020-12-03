#!/bin/bash
set -o errexit -o nounset -o pipefail
which shellcheck > /dev/null && shellcheck "$0"

#
# Compile all .less files from assets/less into .less.css files.
#

(
  cd ./assets/less

  for f in ./*.less; do
    echo "Comiling $f ..."
    (
      lessc "$f"
      echo ""
    ) > "../css/$f.css"
  done

  echo "ok."
)
