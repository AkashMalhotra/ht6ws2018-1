class AccessedController < ApplicationController
    include AccessedHelper
    include CallbackHelper
    def index
      render html: "hello"
    end

end
