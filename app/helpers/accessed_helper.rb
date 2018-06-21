module AccessedHelper
    def get_acc_token
        @acc_token = User.first.access_token
        @byebug
        puts @acc_token
        return @acc_token
    end
end
