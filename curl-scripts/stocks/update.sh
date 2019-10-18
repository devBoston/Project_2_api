# Ex: TOKEN=tokengoeshere ID=idgoeshere TEXT=textgoeshere sh curl-scripts/examples/update.sh

curl "http://localhost:4741/stocks/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "stock": {
      "name": "'"${NAME}"'",
      "purchase_on": "'"${PURCHASE_ON}"'",
      "start_price": "'"${START_PRICE}"'",
      "end_price": "'"${END_PRICE}"'",
      "user_id": "'"${ID}"'"
    }
  }'
  echo
