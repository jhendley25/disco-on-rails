require 'httparty'
service_data = {"service_url":"https://placecage.com","service_name":"place-cage","semantic_profile":"https://placecage.com","request_media_type":"application/json","response_media_type":"application/json","health_ttl":300000,"review_ttl":300000, "tags":"image-generator place-cage"}
options = {
  body: {
    service: service_data
  }
}

# try out register/unregister flow
register_resp = HTTParty.post('http://localhost:3000/register', options)
reg_id = register_resp["reg_id"]
unregister_options = {
  body: {
    reg_id: reg_id
  }
}

response = HTTParty.post('http://localhost:3000/unregister', unregister_options)

# response = HTTParty.get('http://localhost:3000/renew')



# ok the above was 'a service registering'
# i guess the below is 'a service consuming another service' or something
# response = HTTParty.get("http://localhost:3000/find?id")

# response = HTTParty.get('http://localhost:3000/bind')

