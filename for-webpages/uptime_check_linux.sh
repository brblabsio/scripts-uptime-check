#!/bin/bash

# Function to send HTTP HEAD request and capture status code and date
send_head_request() {
  local url="$1"

  # Send the HTTP HEAD request, wait for the response, and capture the status code and date
  response=$(curl -sI -w "%{http_code}" -o /tmp/response_headers "$url")

  # Extract the HTTP status code
  declare -i httpStatusCode="$response"

  # Extract the Date from the response headers
  httpResponseDate=$(grep -i '^Date:' /tmp/response_headers | sed 's/Date: //I')

  # Clean up the temporary file
  rm -f /tmp/response_headers

  # Output the captured values
  echo "HTTP Status Code: $httpStatusCode, HTTP Response Date: $httpResponseDate"
}

# Parse command line flags
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --url)
      url="$2"
      shift # past argument
      shift # past value
      ;;
    --interval)
      interval="$2"
      shift # past argument
      shift # past value
      ;;
    *)
      echo "Unknown flag: $1"
      exit 1
      ;;
  esac
done

# Function to check uptime
check_uptime() {
  local url="$1"
  local interval="$2"

  echo "Checking uptime for URL: $url with interval: $interval seconds"
  local url="$1"
  local interval="$2"

  while true; do
    send_head_request "$url"
    sleep "$interval"
  done
}

# Call the check_uptime function with the URL and interval
check_uptime "$url" "$interval"

