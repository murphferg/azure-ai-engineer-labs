$account_id="175abf08-4bb7-498d-a1e5-1e81580e4a03"
$api_key="e7a6926048494487beaf02191a20e858"
$location="trial"

# Clear the console window
cls

# Call the AccessToken method with the API key in the header to get an access token
$token = Invoke-RestMethod -Method "Get" -Uri "https://api.videoindexer.ai/auth/$location/Accounts/$account_id/AccessToken" -Headers @{'Ocp-Apim-Subscription-Key' = $api_key}

# Use the access token to make an authenticated call to the Videos method to get a list of videos in the account
Invoke-RestMethod -Method "Get" -Uri "https://api.videoindexer.ai/$location/Accounts/$account_id/Videos?accessToken=$token" | ConvertTo-Json -Depth 6
