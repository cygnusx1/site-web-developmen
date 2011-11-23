class Mandat < ActiveRecord::Base
  def self.find_mandats_home
    self.where(:show => true).limit(3).order("created_at desc")
  end
  def self.find_mandats_all
    self.where(:show => true).order("created_at desc")
  end
end
