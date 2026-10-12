#!/bin/sh
set -eu

# Install the JavaScript dependencies
yarn --cwd js install --frozen-lockfile

# Bundle the JavaScript code and regenerate inst/components.txt
yarn --cwd js build

# Generate the NAMESPACE file and documentation
Rscript -e 'devtools::document()'

# Install the package
Rscript -e 'devtools::install()'
