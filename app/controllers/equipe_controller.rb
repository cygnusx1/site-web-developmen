class EquipeController < ApplicationController

  require 'rubygems'
  require 'linkedin'

  def index
    @title = I18n.t("equipe_site_title")
    puts "indexEquipe = " + I18n.locale.to_s
    render :layout => "application"
  end


  def show
    puts params
    render params[:id]
  end
  
  def sylvain
    @title = I18n.t("sylvain_site_title")
  end

  def benoit
    @title = I18n.t("benoit_site_title")
  end

  def stephane
    @title = I18n.t("stephane_site_title")
  end

  def suemarie
    @title = I18n.t("suemarie_site_title")
  end

  def patrick
    @title = I18n.t("patrick_site_title")
  end
  
  
  def ajax_contact
    @name = params[:name]
    linkedinInfo = LinkedinApiInfo.find(1)
    linkedinCred = LinkedinCredential.find_by_name(@name)
    if !linkedinCred.nil?
      client = LinkedIn::Client.new(linkedinInfo.apiKey, linkedinInfo.secretKey)
      client.authorize_from_access(linkedinCred.acctoken, linkedinCred.accsecret)
      # Pick some fields
      fields = ['first-name', 'last-name', 'headline', 'industry', 'num-connections','educations', 'num-recommenders','recommendations-received', 'summary', 'positions','picture-url']
      puts I18n.locale.to_s + '-' + I18n.locale.to_s.capitalize
      LinkedIn::Helpers::Request.const_set("DEFAULT_HEADERS", LinkedIn::Helpers::Request::DEFAULT_HEADERS.merge({'Accept-Language'=> I18n.locale.to_s + '-' + I18n.locale.to_s.capitalize}))
    @profile = client.profile :fields => fields

    end
    render :layout=>false

  rescue SocketError, LinkedIn::Errors::NotFoundError

    flash[:notice]= "Probleme avec LinkedIn"
    render :layout=>false

    end
end
