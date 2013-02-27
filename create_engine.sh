#! /bin/sh

API_HOST='https://api.swiftype.com'
ENGINE_NAME='swiftype-api-example'
VIDEOS='./data/videos/*.json'
CHANNELS='./data/channels/*.json'

if [ $# -eq 0 ]; then
    echo "Please provide your engine key as a command line argument."
    exit 1
fi

if [ $# -gt 1 ]; then
    echo "Too many command line arguments."
    exit 1
fi

# Create the Engine
curl -s -w "Engine create: HTTP %{http_code}\n" \
    -X POST "$API_HOST/api/v1/engines.json?auth_token=$1" \
    -H 'Content-Type: application/json' \
    -d "{\"engine\":{\"name\": \"$ENGINE_NAME\"}}" \
    -o /dev/null

# Create the videos DocumentType
curl -s -w "videos DocumentType create: HTTP %{http_code}\n" \
    -X POST "$API_HOST/api/v1/engines/$ENGINE_NAME/document_types.json?auth_token=$1" \
    -H 'Content-Type: application/json' \
    -d '{"document_type": {"name": "videos"}}' \
    -o /dev/null

# Create the channels DocumentType
curl -s -w "channels DocumentType create: HTTP %{http_code}\n" \
    -X POST "$API_HOST/api/v1/engines/$ENGINE_NAME/document_types.json?auth_token=$1" \
    -H 'Content-Type: application/json' \
    -d '{"document_type": {"name": "channels"}}' \
    -o /dev/null


# Create the Documents in the videos DocumentType
for f in $VIDEOS
do
    echo "Processing $f"
    curl -s -w "Document create for $f: HTTP %{http_code}\n" \
        -X POST "$API_HOST/api/v1/engines/$ENGINE_NAME/document_types/videos/documents/create_or_update.json?auth_token=$1" \
        -H 'Content-Type: application/json' \
        --data @$f
done

for f in $CHANNELS
do
    echo "Processing $f"
    curl -s -w "Document create for $f: HTTP %{http_code}\n" \
        -X POST "$API_HOST/api/v1/engines/$ENGINE_NAME/document_types/channels/documents/create_or_update.json?auth_token=$1" \
        -H 'Content-Type: application/json' \
        --data @$f
done
