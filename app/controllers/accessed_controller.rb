class AccessedController < ApplicationController
    include AccessedHelper
    include CallbackHelper
    def index
        @acc_token = get_acc_token
        response = getResource(@acc_token,'accounts')
        body = JSON.parse(response.body)
		@gross = body["results"][4]["gross_position"]["amount"];
        @totalw = body["results"][4]["total_withdrawals"]["amount"];
        @totald = body["results"][4]["total_deposits"]["amount"];
        @liqValue= body["results"][4]["net_liquidation"]["amount"];
        #puts body
   		@deposit = Deposit.all.map {|e|e.attributes.values}
   		puts @deposit.length
        #render html:body
    end

    def deposit
    	@acc_token = get_acc_token
    	response = getResource(@acc_token,'bank_accounts')
        banks = JSON.parse(response.body)
    	response = getResource(@acc_token,'accounts')
    	deposit = JSON.parse(response.body)
        puts banks["results"]
        puts deposit["results"]
    end
    
    def post
   	end

   	def currentdeposit
   		#puts Deposit.all.map {|e|e.attributes.values}
   		@deposit = Deposit.all.map {|e|e.attributes.values}
   	end

   	def action
    	@acc_token = get_acc_token
   		puts create_deposit(@acc_token, 1.06)
   	end


end
