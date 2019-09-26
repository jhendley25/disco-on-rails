loop do
  Service.all.each do |service|
    puts "checking service: #{service.service_name}"
    if service.health_last_ping > 2.seconds.ago
      service.update(active: false)
    end
  end
  puts "running health checks"
  sleep 5
end