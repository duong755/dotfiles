#!/bin/bash

API_ENDPOINT_LIST_RELEASES=https://api.github.com/repos/docker/compose/releases
curl -s "$API_ENDPOINT_LIST_RELEASES" | jq '.[] | { tag_name: .tag_name } | .tag_name'