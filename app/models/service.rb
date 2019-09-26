class Service < ApplicationRecord

  def update_and_register(params)
    self.update(params)

    self.reg_id = SecureRandom.uuid
    self.active = true
    self.save
  end

  def deactivate
    self.active = false
  end
end
