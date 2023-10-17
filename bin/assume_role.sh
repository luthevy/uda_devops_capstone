#!/bin/bash
# Using to export AWS credentials as environment variables

# Unset any variables HTTP_PROXY, HTTPS_PROXY, NO_PROXY, http_proxy, https_proxy, no_proxy.
unset http_proxy https_proxy no_proxy
unset HTTP_PROXY HTTPS_PROXY NO_PROXY

# Assume role and get temporary security credentials.
assumrole=$(aws sts assume-role \
  --duration-seconds 3600 \
  --role-arn arn:aws:iam::xxxxxx:role/xxxx-stg-usermng-deveks-role-001 \
  --role-session-name aws-infra-cli \
  --endpoint-url https://sts.ap-northeast-1.amazonaws.com)

# Extract, store the Access Key ID.
AWS_ACCESS_KEY_ID=$(jq -r '.Credentials.AccessKeyId' <<< ${assumrole})
echo $AWS_ACCESS_KEY_ID
export AWS_ACCESS_KEY_ID

# Extract, store the Secret Access Key.
AWS_SECRET_ACCESS_KEY=$(jq -r '.Credentials.SecretAccessKey' <<< ${assumrole})
echo $AWS_SECRET_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY

# Extract, store the Session Token.
AWS_SESSION_TOKEN=$(jq -r '.Credentials.SessionToken' <<< ${assumrole})
echo $AWS_SESSION_TOKEN
export AWS_SESSION_TOKEN

# Add the path to the Gloo CLI binary to the system PATH.
export PATH=$HOME/.gloo/bin:$PATH

# Notify 'done'
echo 'Done'

bash