#!/bin/bash
# This file assumes a role and exports the credentials as environment variables

# Usage: source assume_role.sh
unset http_proxy https_proxy no_proxy
# Unset any existing HTTP_PROXY, HTTPS_PROXY, and NO_PROXY environment variables (if set).
unset HTTP_PROXY HTTPS_PROXY NO_PROXY

# Assume an AWS IAM role and get temporary security credentials.
# The duration of the credentials is set to 3600 seconds (1 hour).
# The '--role-arn' parameter specifies the ARN of the IAM role to assume.
# The '--role-session-name' parameter provides a name for the role session.
# The '--endpoint-url' parameter specifies the AWS STS endpoint URL.
assumrole=$(aws sts assume-role \
  --duration-seconds 3600 \
  --role-arn arn:aws:iam::xxxxxx:role/xxxx-stg-usermng-deveks-role-001 \
  --role-session-name aws-infra-cli \
  --endpoint-url https://sts.ap-northeast-1.amazonaws.com)

# Extract and store the Access Key ID from the assume-role response using jq.
AWS_ACCESS_KEY_ID=$(jq -r '.Credentials.AccessKeyId' <<< ${assumrole})
echo $AWS_ACCESS_KEY_ID

# Export the Access Key ID as an environment variable for AWS CLI to use.
export AWS_ACCESS_KEY_ID

# Extract and store the Secret Access Key from the assume-role response using jq.
AWS_SECRET_ACCESS_KEY=$(jq -r '.Credentials.SecretAccessKey' <<< ${assumrole})
echo $AWS_SECRET_ACCESS_KEY

# Export the Secret Access Key as an environment variable for AWS CLI to use.
export AWS_SECRET_ACCESS_KEY

# Extract and store the Session Token from the assume-role response using jq.
AWS_SESSION_TOKEN=$(jq -r '.Credentials.SessionToken' <<< ${assumrole})
echo $AWS_SESSION_TOKEN

# Export the Session Token as an environment variable for AWS CLI to use.
export AWS_SESSION_TOKEN

# Add the path to the Gloo CLI binary to the system PATH.
# Assuming the Gloo CLI binary is located at $HOME/.gloo/bin.
export PATH=$HOME/.gloo/bin:$PATH

# Print 'Done' to the console.
echo 'Done'

# Start an interactive bash shell.
bash