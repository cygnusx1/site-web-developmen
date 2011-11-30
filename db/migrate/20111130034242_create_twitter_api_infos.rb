class CreateTwitterApiInfos < ActiveRecord::Migration
  def self.up
    create_table :twitter_api_infos do |t|
      t.string :consumer_key
      t.string :consumer_secret
      t.string :oauth_token
      t.string :oauth_token_secret
      
      t.timestamps
    end
  end

  def self.down
    drop_table :twitter_api_infos
  end
end
