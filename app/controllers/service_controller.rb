class ServiceController < ApplicationController
  def index
    @title = I18n.t("services_site_title")

  end
end
