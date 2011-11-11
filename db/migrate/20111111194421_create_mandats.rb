class CreateMandats < ActiveRecord::Migration
  def self.up
    create_table :mandats do |t|
      t.string :title
      t.string :description, :limit => 1000
      t.string :duree
      t.string :location
      t.boolean :show
      t.date :expiration
      t.boolean :renew
      t.timestamps
    end
  end

  def self.down
    drop_table :mandats
  end
end
