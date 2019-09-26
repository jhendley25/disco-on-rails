class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :service_url
      t.string :service_name
      t.string :semantic_profile
      t.string :request_media_type
      t.string :response_media_type
      t.integer :health_ttl
      t.integer :renew_ttl
      t.datetime :health_last_ping
      t.datetime :renew_last_ping
      t.string :reg_id
      t.boolean :active
      t.timestamps
    end
  end
end
