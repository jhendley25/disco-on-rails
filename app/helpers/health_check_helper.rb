module HealthCheckHelper
  def self.start
    loop do
      Service.all.each do |service|
        # puts "checking service: #{service.service_name}"
        if service.health_last_ping > Time.now - service.health_ttl and service.active
          service.update(active: false)
        end
      end
      sleep 5
    end
  end
end
