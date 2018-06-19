class AccessedController < ApplicationController
    include AccessedHelper
    include CallbackHelper
    def index
        @acc_token = get_acc_token
        response = getResource(@acc_token,'bank_accounts')
        body = JSON.parse(response.body)
        puts body
        render html:body
    end

end
