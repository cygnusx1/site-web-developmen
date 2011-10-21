class Linkedinkey < ActiveRecord::Migration
  def self.up
     LinkedinApiInfo.create :applicationName => "developmen", :apiKey => "1ifhrhz286kc", :secretKey => "WfjPils5OvoJGuvW"
  end

  def self.down
  end
end
