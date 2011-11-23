class MandatsController < ApplicationController
  
  def index
    @mandat = Mandat.find_mandats_all
  end
end
