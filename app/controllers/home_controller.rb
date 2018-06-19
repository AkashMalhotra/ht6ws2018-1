class HomeController < ApplicationController
    include CallbackHelper

    def index
      # Display the login link.
      puts get_login_url
      @login_url = get_login_url
    end

end
