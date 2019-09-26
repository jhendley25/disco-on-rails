class Service < ApplicationRecord
  has_many :tags
  before_save :set_ping_timestamps
  def update_and_register(params)
    self.update(params.except(:tags))
    self.create_tags(params[:tags])

    self.reg_id = SecureRandom.uuid
    self.active = true
    self.save!
  end

  def deactivate
    self.active = false
  end

  def create_tags(new_tags)
    new_tags.split(" ").each do |t|
      self.tags.find_or_create_by({name: t})
    end
  end

  def set_ping_timestamps
    self.health_last_ping = Time.now
    self.renew_last_ping = Time.now
  end
  
end
