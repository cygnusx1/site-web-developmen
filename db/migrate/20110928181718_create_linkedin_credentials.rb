class CreateLinkedinCredentials < ActiveRecord::Migration
  def self.up
    create_table :linkedin_credentials do |t|
      t.string :name
      t.string :pin
      t.string :reqtoken
      t.string :reqsecret
      t.string :acctoken
      t.string :accsecret

      t.timestamps
    end
  end

  def self.down
    drop_table :linkedin_credentials
  end
end
