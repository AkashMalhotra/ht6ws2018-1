class HomeController < ApplicationController
    include CallbackHelper

    def index
      # Display the login link.
      @login_url = get_login_url
    end

    def gettoken
      auth_code = params[:code]
      token = get_token_from_code(auth_code)
      render html: token
  end
end
