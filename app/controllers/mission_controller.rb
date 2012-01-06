class MissionController < ApplicationController
  def index
    @title = I18n.t("mission_site_title")

  end
end
