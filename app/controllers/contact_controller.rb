class ContactController < ApplicationController
  def index
    @title = I18n.t("contact_site_title")

  end
end
