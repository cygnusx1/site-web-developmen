class CreateLinkedinApiInfos < ActiveRecord::Migration
  def self.up
    create_table :linkedin_api_infos do |t|
      t.string :applicationName
      t.string :apiKey
      t.string :secretKey

      t.timestamps
    end
  end

  def self.down
    drop_table :linkedin_api_infos
  end
end
