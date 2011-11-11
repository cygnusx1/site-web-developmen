class HomeController < ApplicationController
  def index
    @mandat = Mandat.where(:show=> true)
  end

end
