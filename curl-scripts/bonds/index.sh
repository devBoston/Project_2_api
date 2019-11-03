#!/bin/bash

curl "http://localhost:4741/bonds" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
