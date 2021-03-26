# Address API

## What it does

Address API that takes a full_address string and uses geocoding to parse and return the components of the address.

Input:
> Julie-Wolfthorn-Straße 1, Berlin

Output:
> [
>  {
>    "id": 1,
>    "full_address": "Julie-Wolfthorn-Straße 1, Berlin",
>    "street": "Einstein Kaffee, 1, Julie-Wolfthorn-Straße, Mitte, Berlin, 10115, Deutschland",
>    "house_number": "1",
>    "postcode": "10115",
>    "city": "Berlin",
>    "country": "Deutschland"
>  }
> ]

## Test the API

### Index & Show - to display data:
curl -s http://localhost:3000/api/v1/addresses | jq
curl -s http://localhost:3000/api/v1/addresses/1 | jq

### Create:
curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -d '{ "address": { "full_address": "Julie-Wolfthorn-Straße 1, Berlin" } }' \
     http://localhost:3000/api/v1/addresses
