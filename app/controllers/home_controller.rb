class HomeController < ApplicationController
  require 'rubygems'
  require 'twitter'

  def index
    @mandat = Mandat.find_mandats_home
    @title = I18n.t("site_title")

  end

  def ajax_twitter

    twitterAccount = TwitterApiInfo.find(1)

    Twitter.configure do |config|
      config.consumer_key = twitterAccount.consumer_key
      config.consumer_secret = twitterAccount.consumer_secret
      config.oauth_token = twitterAccount.oauth_token
      config.oauth_token_secret = twitterAccount.oauth_token_secret
    end

    twittertimeline = Twitter.user_timeline(:count => 5)


    @tweets = []
    twittertimeline.each do |tweet|
      tw = Tweet.new tweet.user.profile_image_url_https, tweet.text, tweet.user.name, tweet.created_at
      @tweets << tw
    end

    render :layout=>false

  rescue SocketError
    @tweets = []

    flash[:notice]= "Probleme avec Twitter"
    render :layout=>false
    end

  class Tweet
    def initialize(pics, tweet, name, time)
      @pics = pics
      @tweet = tweet
      @name = name
      @time = time
    end
    attr_writer :pics, :tweet, :name, :time
    attr_reader :pics, :tweet, :name, :time

  end

end
