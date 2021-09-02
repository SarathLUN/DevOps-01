AWS_ACCOUNT_ID="977529743287"
AWS_REGION="ap-southeast-1"

aws --region ${AWS_REGION} ecr get-login-password | docker login --password-stdin --username AWS "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
