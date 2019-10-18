#!/bin/bash

curl "http://localhost:4741/stocks" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
