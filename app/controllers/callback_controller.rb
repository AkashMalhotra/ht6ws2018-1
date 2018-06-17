class CallbackController < ApplicationController
    include CallbackHelper
    
    def gettoken
        #user = User.new()
        token = get_token_from_code
        owner_id = token["resource_owner_id"]
        client_id = token["client_canonical_id"]
        puts token
        #user.update_attributes[access_token: "aaaa"]
        #session[:btoken] = token["access_token"]
        @token = token
        #response = create_deposit(token["access_token"])
        #response = getResource(token["access_token"],'bank_accounts')
        #body = JSON.parse(response.body)
        #render html: body
        #accounts = body["results"]
        #get tfsa account
        #tfsa = accounts.select{ |acc| acc["type"] == 'ca_tfsa'}
        #render html: tfsa
        #@token = token
        #render html: accounts
        #accounts = get_bank_accounts(token["access_token"])
        #@token = accounts
        #puts token['refresh_token']
        #render html: "#{response.body}"
    end
end
