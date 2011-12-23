class ApplicationController < ActionController::Base
  before_filter :set_locale
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    puts I18n.locale.to_s
    puts params
  end

  protect_from_forgery

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
end
