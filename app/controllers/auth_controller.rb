class AuthController < ApplicationController
    include AuthHelper
    def gettoken
        token = get_token_from_code params[:code]
        render text: "TOKEN: #{token.token}"
    end
end
