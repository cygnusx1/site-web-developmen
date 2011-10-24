class ContactController < ApplicationController

  require 'rubygems'
  require 'linkedin'


  def index
    
        flash[:tip] = I18n.t(:message_contact)

  end
  

  def sylvain

  end
  
  def benoit

  end
  
  def stephane
    
  end
  
  def suemarie
    
  end
  
  def regis
    
  end
  
  def ajax_contact
    @name = params[:name]
    puts @name
    linkedinInfo = LinkedinApiInfo.find(1)
    linkedinCred = LinkedinCredential.find_by_name(@name)
    if !linkedinCred.nil?
      client = LinkedIn::Client.new(linkedinInfo.apiKey, linkedinInfo.secretKey)
      client.authorize_from_access(linkedinCred.acctoken, linkedinCred.accsecret)
      # Pick some fields
      fields = ['first-name', 'last-name', 'headline', 'industry', 'num-connections','educations', 'num-recommenders','recommendations-received', 'summary', 'positions','picture-url']
      
      @profile = client.profile :fields => fields
      @profile.recommendations_received.all.each {|rec| puts rec.recommendation_text}
     
     
      #puts @profile
      
    end
      render :layout=>false

  rescue SocketError, LinkedIn::Errors::NotFoundError 

    flash[:notice]= "Probleme avec LinkedIn"
    render :layout=>false
 
    
  end
end
