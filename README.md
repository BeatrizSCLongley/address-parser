# Address API

## What it does

Address API that takes a full_address string and uses google geocoding API to parse and return the components of the address.

Input:
> Julie-Wolfthorn-Straße 1, Berlin

Output:
> [
>  {
>    "id": 1,
>    "full_address": "Julie-Wolfthorn-Straße 1, Berlin",
>    "street": "Julie-Wolfthorn-Straße",
>    "house_number": "1",
>    "postcode": "10115",
>    "city": "Berlin",
>    "country": "Deutschland"
>  }
> ]


## How to clone & use this service:

1. Clone repository

2. Create a Google API key to use in this project
> https://developers.google.com/maps/documentation/geocoding/get-api-key

3. Create .env file to save Google API key as such:
> GOOGLE_API_SERVER_KEY=AIzaSyDMg1******************8wxJqE

4. Test the API


## Test the API
While running *rail s*

### Create:

curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -d '{ "full_address": "Julie-Wolfthorn-Straße 1, Berlin" }' \
     http://localhost:3000/api/v1/addresses

### Index & Show - to display data:

curl -s http://localhost:3000/api/v1/addresses | jq

curl -s http://localhost:3000/api/v1/addresses/1 | jq
