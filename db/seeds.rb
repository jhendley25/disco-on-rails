# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bill = {
  :service_url => "https://fillmurray.com",
  :service_name => "fill-murray",
  :semantic_profile => "https://fillmurray.com",
  :request_media_type => "application/json",
  :response_media_type => "application/json",
  :health_ttl => 300000,
  :renew_ttl => 300000,
  :health_last_ping => Time.now,
  :renew_last_ping => Time.now,
}
nic = {
  :service_url => "https://placecage.com",
  :service_name => "place-cage",
  :semantic_profile => "https://placecage.com",
  :request_media_type => "application/json",
  :response_media_type => "application/json",
  :health_ttl => 300000,
  :renew_ttl => 300000,
  :health_last_ping => Time.now,
  :renew_last_ping => Time.now,
}

Service.create(bill).create_tags("image-generator bill-murray")
Service.create(nic).create_tags("image-generator place-cage")