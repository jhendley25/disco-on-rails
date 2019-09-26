require 'httparty'
service_data = {"service_url":"https://placecage.com","service_name":"place-cage","semantic_profile":"https://placecage.com","request_media_type":"application/json","response_media_type":"application/json","health_ttl":300000,"renew_ttl":3, "tags":"image-generator place-cage"}
options = {
  body: {
    service: service_data
  }
}

# try out register/unregister flow
register_resp = HTTParty.post('http://localhost:3000/register', options)
reg_id = register_resp["service"]["reg_id"]
puts "*"*80
puts "placecage service registered, id is #{reg_id}"
puts "*"*80

# ok the above was 'a service registering'
# i guess the below is 'a service consuming another service' or something
# 1 active service
response = HTTParty.get("http://localhost:3000/find?tags=image-generator")
result_count = response.length

puts "*"*80
puts "Registry search results: #{result_count} found"
response.each do |service|
  puts "Service: #{service["service_name"]}"
end
puts "*"*80

sleep 1

unregister_options = {
  body: {
    reg_id: reg_id
  }
}


response = HTTParty.post('http://localhost:3000/unregister', unregister_options)

puts "*"*80
puts "placecage service unregistered"
puts "*"*80

sleep 1

response = HTTParty.get("http://localhost:3000/find?tags=image-generator")
result_count = response.length
puts "*"*80
puts "Registry search results: #{result_count} found"
response.each do |service|
  puts "Service: #{service["service_name"]}"
end
puts "*"*80



register_resp = HTTParty.post('http://localhost:3000/register', options)
reg_id = register_resp["service"]["reg_id"]
puts "*"*80
puts "placecage service re-registered with short renew_ttl, id is #{reg_id}"
puts "*"*80

response = HTTParty.get("http://localhost:3000/find?tags=image-generator")
result_count = response.length
puts "*"*80
puts "Registry search results: #{result_count} found"
response.each do |service|
  puts "Service: #{service["service_name"]}"
end
puts "*"*80

puts "*"*80
puts "Waiting 5 seconds to make sure the healthcheck kicks in..."
puts "*"*80
sleep 5

puts "...And searching again"
response = HTTParty.get("http://localhost:3000/find?tags=image-generator")
result_count = response.length
puts "*"*80
puts "Registry search results: #{result_count} found"
response.each do |service|
  puts "Service: #{service["service_name"]}"
end
puts "*"*80






# response = HTTParty.get('http://localhost:3000/renew')

# response = HTTParty.get('http://localhost:3000/bind')

