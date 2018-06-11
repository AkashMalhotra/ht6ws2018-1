class AccessedController < ApplicationController
  include AuthHelper
  require 'httparty'
  def index
    token = get_access_token

    if token
      # If a token is present in the session, get messages from the inbox
      
      #callback = Proc.new do |r| 
      #  r.headers['Authorization'] = "Bearer #{token}"
      #end
      puts token
      api_auth_header = {"Authorization" => "Bearer #{token}"}
      url = ("https://api.sandbox.wealthsimple.com/v1/%s" % ['users'])
      puts HTTParty.get(url, headers: api_auth_header).body

      redirect_to root_url
    else
      # If no token, redirect to the root url so user
      # can sign in.
      redirect_to root_url
    end
  end
end
