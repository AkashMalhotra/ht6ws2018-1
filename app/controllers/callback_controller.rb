class CallbackController < ApplicationController
    include CallbackHelper
    
    def gettoken
        token = get_token_from_code
        #owner_id = token["resource_owner_id"]
        #client_id = token["client_canonical_id"]
        acc_token = token["access_token"]
        ref_token = token["refresh_token"]

        #hacky way of limiting the model to one user only
        if User.any?
            User.first.destroy
        end
        user = User.create(access_token: acc_token, refresh_token: ref_token)
        puts user
        #response = create_deposit(token["access_token"])
        #response = getResource(token["access_token"],'bank_accounts')
        #body = JSON.parse(response.body)
        @token = user.access_token
        puts @token
        render "accessed/index"
        #render html: body
        #accounts = body["results"]
        #get tfsa account
        #tfsa = accounts.select{ |acc| acc["type"] == 'ca_tfsa'}
        #render html: tfsa
        #render html: accounts
        #accounts = get_bank_accounts(token["access_token"])
        #@token = accounts
        #puts token['refresh_token']
        #render html: "#{response.body}"
    end
end
