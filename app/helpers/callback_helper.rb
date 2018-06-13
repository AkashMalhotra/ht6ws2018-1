module CallbackHelper
  # App's client ID. Register the app in Application Registration Portal to get this value.
  CLIENT_ID = '028e0e8082c2551e67aa6b0a8de6c83e125d313e3fad9d7392aa1e78bdba9200'
  # App's client secret. Register the app in Application Registration Portal to get this value.
  CLIENT_SECRET = '8ec4270af0d79a170445a65f7f9e792df0ab813fa07f938f10c11390f7aba799'

  # Scopes required by the app
  SCOPES = [ 'read write' ]

  REDIRECT_URI =  "http://localhost:3000/callback" # Registered

  # Generates the login URL for the app.
  def get_login_url
    response_type = 'code'
    scope = 'read write'
    state = '1234'
    url =  "https://staging.wealthsimple.com/oauth/authorize?client_id=#{CLIENT_ID}&redirect_uri=#{REDIRECT_URI}&response_type=#{response_type}&scope=#{scope}&state=#{state}"
  end

  # Exchanges an authorization code for a token
  def get_token_from_code()

    code = params[:code]
    state = params[:state]

    url = 'https://api.sandbox.wealthsimple.com/v1/oauth/token'

    post_params = {}

    post_params[:client_id] = CLIENT_ID
    post_params[:client_secret] = CLIENT_SECRET
    post_params[:grant_type] = 'authorization_code'
    post_params[:redirect_uri] = REDIRECT_URI
    post_params[:code] = code

    full_params = "#{url}?#{post_params.to_query}"
    response = HTTParty.post(full_params)

  end

  def get_bank_accounts(token)

    require 'uri'
    require 'net/http'

    url = URI("https://api.sandbox.wealthsimple.com/v1/accounts")

    http = Net::HTTP.new(url.host, url.port)

    http.use_ssl = true
    # might need this as well? 
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{token}"

    response = http.request(request)
    puts response.read_body
    puts "hello"
  end

  # Gets the current access token
def get_access_token()
  # Get the current token hash from session
  token_hash = session[:ws_token]

  client = OAuth2::Client.new(CLIENT_ID,
                              CLIENT_SECRET,
                              :site => 'https://api.sandbox.wealthsimple.com/',
                              :token_url => '/v1/oauth/token',
                              :auth_scheme => :request_body
                              )

  token = OAuth2::AccessToken.from_hash(client, token_hash)

  # Check if token is expired, refresh if so
  if token.expired?
    new_token = token.refresh!
    # Save new token
    session[:ws_token] = new_token.to_hash
    access_token = new_token.token
  else
    access_token = token.token
  end
end
end
