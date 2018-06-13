class CallbackController < ApplicationController
    include CallbackHelper
    
    def gettoken
        token = get_token_from_code
        puts token
        #@token = token

        accounts = get_bank_accounts(token["access_token"])
        @token = accounts
        #puts token['refresh_token']
        #render html: "Access Token: #{token}"
        #session[:ws_token] = token.to_hash
        #redirect_to accessed_index_url
    end
end
