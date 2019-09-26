class Service < ApplicationRecord
  has_many :tags
  def update_and_register(params)
    self.update(params)
    self.create_tags(params[:tags])

    self.reg_id = SecureRandom.uuid
    self.active = true
    self.save
  end

  def deactivate
    self.active = false
  end

  def create_tags(new_tags)
    new_tags.split(" ").each do |t|
      self.tags.find_or_create_by({name: t})
    end
  end
  
end
