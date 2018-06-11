class CallbackController < ApplicationController
    include CallbackHelper

    def gettoken
        token = get_token_from_code params[:code]
        render html: "TOKEN: #{token.token}"
        #session[:ws_token] = token.to_hash
        #redirect_to accessed_index_url
    end
end
