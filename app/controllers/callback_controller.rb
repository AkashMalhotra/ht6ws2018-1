class CallbackController < ApplicationController
    include CallbackHelper

    def gettoken
        token = get_token_from_code params[:code]
        session[:ws_token] = token.to_hash
        render text: "Access token saved in session cookie."
        #render plain: "#{token.token}"
    end
end
