Trunk::Application.routes.draw do

  scope "(:locale)", :locale => /en|fr/ do

    match 'home' => 'home#index'
    match 'home/ajax_twitter' => 'home#ajax_twitter'
    
    match 'equipe/callback' => 'equipe#callback'
    match 'equipe/auth' => 'equipe#auth'
    match 'equipe/ajax_contact' => 'equipe#ajax_contact'
    
    resources :equipe


    match 'linkedinauth/callback' => 'linkedinAuth#callback'
    match 'linkedinauth/init_auth' => 'linkedinAuth#init_auth'

    resources :mission
    #match 'mission' => 'mission#index'
    resources :service
    #match 'service' => 'service#index'
    #match 'developmen' => 'developmen#index'
    resources :developmen
#    match 'contact' => 'contact#index'
    resources :contact
    resources :mandats
    #match 'mandats' => 'mandats#index'
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config

  end


    # match 'equipe' => 'equipe#index'    
    # match 'equipe/sylvain' => 'equipe#sylvain'
    # match 'equipe/benoit' => 'equipe#benoit'
    # match 'equipe/stephane' => 'equipe#stephane'
    # match 'equipe/suemarie' => 'equipe#suemarie'
    # match 'equipe/regis' => 'equipe#regis'
    # match 'equipe/fred' => 'equipe#fred'


  match '/:locale' => "home#index"
  root :to => "home#index"

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

end
