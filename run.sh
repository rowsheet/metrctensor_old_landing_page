REPO_NAME=fake_ecommerce
SERVICE_NAME=dev--$REPO_NAME
echo REPO_NAME:$REPO_NAME
echo SERVICE_NAME:$SERVICE_NAME
#-------------------------------------------------------------------------------
# Remove the old service.
#-------------------------------------------------------------------------------
docker service rm $SERVICE_NAME

#-------------------------------------------------------------------------------
# Build the new image.
#-------------------------------------------------------------------------------
docker build -t rowsheet/$REPO_NAME:dev .

#-------------------------------------------------------------------------------
# Source credentials.
#-------------------------------------------------------------------------------
source ./creds

docker service create \
    --env PORT="$PORT" \
    --env RATE_LIMITER="$RATE_LIMITER" \
    --env SITE_NAME="$SITE_NAME" \
    --env THEME="$THEME" \
    --publish 8006:80 \
    --name $SERVICE_NAME \
    rowsheet/$REPO_NAME:dev
