class MandatsController < ApplicationController
  def index
    @title = I18n.t("mandats_site_title")
    @mandat = Mandat.find_mandats_all
  end
end
