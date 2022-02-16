#!/usr/bin/env bash
# This script initializes a repository deployed from this template.
# Skip prompts by setting environment variables SHORT_DESCRIPTION and/or LONG_DESCRIPTION
# If LONG_DESCRIPTION is not set then it will default to the value in SHORT_DESCRIPTION

set -e;

SED_COMMAND="sed -i"
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS doesn't use GNU sed and has a slightly different syntax
  SED_COMMAND="sed -i '' -E"
fi

function update_package_json() {
  local -r package_name="$1"
  local description

  until test -n "${description:=${SHORT_DESCRIPTION}}"; do
    echo "Enter a short description for the repository (package.json):"
    echo '  (e.g. "Contains modules for deploying and managing <type> resources.")'
    read -r description;
  done
  eval "$SED_COMMAND 's/template-terraform-package/$package_name/g' package.json"
  eval "$SED_COMMAND 's/{{package_description}}/$description/g' package.json"
  npm install
}

function update_readme() {
  local -r package_name="$1"
  local description

  description="${LONG_DESCRIPTION:-${SHORT_DESCRIPTION}}"
  until test -n "${description:=${LONG_DESCRIPTION:-${SHORT_DESCRIPTION}}}"; do
    echo "Enter a long description for the repository (README.md):"
    echo '  (e.g. "This repository contains modules for deploying and managing <type> resources. <context>.")'
    read -r description
  done
  eval "$SED_COMMAND 's/template-terraform-package/$package_name/g' README.md"
  eval "$SED_COMMAND 's/{{package_description}}/$description/g' README.md"
}

function main() {
  local -r repository_name=$(git remote -v | grep push | sed -e 's|.*/||' | sed -e 's/.git.*//')

  echo "Initializing repository from template..."
  echo "Using repository name as the package name ($repository_name)..."

  update_package_json "$repository_name"
  update_readme "$repository_name"

  rm -rf .init-template.sh

  echo ""
  echo "Initialization complete. Committing to source control..."
  git add -A
  git commit -m "Initialize repository from template"
  git push -u origin master
}

main "$@"
