class HomeController < ApplicationController
  def index
    @mandat = Mandat.find_mandats_home
  end

end
