#!/usr/bin/env bash

# Set up PYTHONPATH and other needed environment variables
# This script will also source user_environment.sh where you can specify
# overrides if required for your system

if [ "$0" = "$_" ]; then
echo This script is intended to be invoked using \"source environment.sh\"
echo Calling it as a standalone script will have no effect.
exit 1
fi

SCRIPT_DIR=$(dirname "$0")
LIBTRELLIS_DIR="${SCRIPT_DIR}/libtrellis:${SCRIPT_DIR}/util:${SCRIPT_DIR}/util/common"
export PYTHONPATH="${LIBTRELLIS_DIR}:${PYTHONPATH}"

USER_ENV="${SCRIPT_DIR}/user_environment.sh"

if [ ! -f "$USER_ENV" ]; then
cat > "${USER_ENV}" << EOT
#!/usr/bin/env bash
# This file allows you to set up custom settings that are applied when you
# run `source environment.sh`

# Changes to this file will be automatically ignored by Git

# export DIAMONDDIR=/usr/local/diamond/3.10_x64
EOT
fi

source "$USER_ENV"