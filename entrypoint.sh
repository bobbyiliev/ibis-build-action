#!/bin/bash

set -o pipefail

# Path to your Ibis ebook
ibis_path=${IBIS_PATH:-./}
# Branch to push the changes to
branch=${IBIS_BRANCH:-main}
# Email id used while committing to the repo
email=${EMAIL:-bobby@bobbyiliev.com}
# The commit message
commit_message=${COMMIT_MESSAGE:-Updated Ibis Exorted Files}

# build the PDF
cd ${ibis_path}
/tmp/vendor/bin/ibis build
/tmp/vendor/bin/ibis build dark
/tmp/vendor/bin/ibis sample
/tmp/vendor/bin/ibis sample dark

# commit the new files
git config --global user.email 
git remote set-url origin `https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git`
git fetch
git checkout ${branch}
git add ${ibis_path}/export/
git commit -m "${commit_message}"
git push origin ${branch}