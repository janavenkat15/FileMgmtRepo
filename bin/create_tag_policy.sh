#!/bin/bash

# Variables
ORG=janavenkat15
REPO=$1
ENVIRONMENT=$2
TAG_PATTERN=$3

# Create or update the environment with the tag pattern
gh api \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  "/repos/$ORG/$REPO/environments/$ENVIRONMENT/deployment-branch-policies" \
  -f "name=$TAG_PATTERN" \
  -f "type=tag"

echo "Environment '$ENVIRONMENT' in repository '$REPO' has been configured with tag pattern '$TAG_PATTERN'."