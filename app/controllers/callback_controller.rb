class CallbackController < ApplicationController
    include CallbackHelper
    
    def gettoken
        token = get_token_from_code
        owner_id = token["resource_owner_id"]
        client_id = token["client_canonical_id"]
        puts token
        response = getResource(token["access_token"],'accounts')
        body = JSON.parse(response.body)
        accounts = body["results"]

        #get tfsa account
        tfsa = accounts.select{ |acc| acc["type"] == 'ca_tfsa'}
        render html: tfsa
        #@token = token

        #accounts = get_bank_accounts(token["access_token"])
        #@token = accounts
        #response = getResource(token["access_token"],'users')
        #puts token['refresh_token']
        #render html: "#{response.body}"
    end
end
