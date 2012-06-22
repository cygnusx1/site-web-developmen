class LinkedinAuthController < ApplicationController
  
  def init_auth
    name = params[:name]
    callback = params[:callback]
    authenticate_with_linkedin :name=>name,:callback=>callback
  end
  
  def callback
    name = params[:name]
    linkedinCred = LinkedinCredential.find_by_name(name)
    finalize_linkedin_authentication :linkedin_access=>linkedinCred
    
  end
  
  
  def suemary
    
  end
  
  def sylvain
    
  end
  
  def patrick
    
  end
  
  def stephane
    
  end
  
  def regis
    
  end
  
  private
  
  # This method persist the access key and secret comming from LinkedIN when the user authaurize the access.
  # once done, every other request will use these access key from the DB.
  def finalize_linkedin_authentication(option={})
    linkedinCred = option[:linkedin_access]
    linkedinInfo = LinkedinApiInfo.find(1)
    client = LinkedIn::Client.new(linkedinInfo.apiKey, linkedinInfo.secretKey)
    if linkedinCred.acctoken.nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(linkedinCred.reqtoken.to_s, linkedinCred.reqsecret.to_s, pin)
      linkedinCred.acctoken = atoken
      linkedinCred.accsecret = asecret      
      linkedinCred.save
    else
      client.authorize_from_access(linkedinCred.acctoken, linkedinCred.accsecret)
    end
    
    redirect_to  "/equipe/" + linkedinCred.name
    rescue SocketError
      flash[:notice].now = 'Unable to connect via LinkedIn'
       redirect_to  "/equipe/" + linkedinCred.name
  end
  
  #This method get the API Key and Secret from the DB and call LinkedIn to retreive the request Key
  # then we do a lookup in the DB to see if the user is already registered.
  # once the request key is persisted we redirect to LinkedIn to let the user authaurize the site
  # to access his/her info.
  def authenticate_with_linkedin(option={})
    name = option[:name]
    callback = option[:callback]
    # get your api keys at https://www.linkedin.com/secure/developer
    # We have the keys in the database.
    linkedinInfo = LinkedinApiInfo.find(1)
    client = LinkedIn::Client.new(linkedinInfo.apiKey, linkedinInfo.secretKey)
    request_token = client.request_token(:oauth_callback =>
    "http://#{request.host_with_port}#{callback}")
    
    # try to find in the DB, the user with the credential, 
    linkedinCred = LinkedinCredential.find_by_name(name)
    if linkedinCred.nil?
      # not found, then we create a new record
      linkedinCred = LinkedinCredential.new
      linkedinCred.name = name
      linkedinCred.reqtoken = request_token.token
      linkedinCred.reqsecret = request_token.secret
      linkedinCred.save
    else
      # if the user exist, we only update the new keys
      linkedinCred.name = name
      linkedinCred.reqtoken = request_token.token
      linkedinCred.reqsecret = request_token.secret
      linkedinCred.save
            
    end
    
    # Call linkedIn URL to ask the user to login and accept to share info with our site
    redirect_to client.request_token.authorize_url
    rescue SocketError
      flash[:notice] = 'Unable to connect via LinkedIn'
       redirect_to  "/equipe/" + name
    
    
  end
end
