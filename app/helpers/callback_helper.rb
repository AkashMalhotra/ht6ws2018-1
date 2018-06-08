module CallbackHelper

  # App's client ID. Register the app in Application Registration Portal to get this value.
  CLIENT_ID = '028e0e8082c2551e67aa6b0a8de6c83e125d313e3fad9d7392aa1e78bdba9200'
  # App's client secret. Register the app in Application Registration Portal to get this value.
  CLIENT_SECRET = '8ec4270af0d79a170445a65f7f9e792df0ab813fa07f938f10c11390f7aba799'

  # Scopes required by the app
  SCOPES = [ 'read' ]

  REDIRECT_URI =  "http://localhost:3000/callback" # Temporary!

  # Generates the login URL for the app.
  def get_login_url
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => 'https://staging.wealthsimple.com/oauth/authorize',
                                :response_type => 'code',
                                :state => '777')

    login_url = client.auth_code.authorize_url(:redirect_uri => REDIRECT_URI, :scope => SCOPES.join(' '))
  end

  # Exchanges an authorization code for a token
def get_token_from_code(auth_code)
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => 'https://api.sandbox.wealthsimple.com/',
                                :grant_type => 'authorization_code',
                                :token_url => '/v1/oauth/token',
                                :auth_scheme => :request_body
                                )
    token = client.auth_code.get_token(auth_code,
                                       :redirect_uri => REDIRECT_URI)
  end

  # Gets the current access token
def get_access_token
  # Get the current token hash from session
  token_hash = session[:ws_token]

  client = OAuth2::Client.new(CLIENT_ID,
                              CLIENT_SECRET,
                              :site => 'https://login.microsoftonline.com',
                              :authorize_url => '/common/oauth2/v2.0/authorize',
                              :token_url => '/common/oauth2/v2.0/token')

  token = OAuth2::AccessToken.from_hash(client, token_hash)

  # Check if token is expired, refresh if so
  if token.expired?
    new_token = token.refresh!
    # Save new token
    session[:azure_token] = new_token.to_hash
    access_token = new_token.token
  else
    access_token = token.token
  end
end
end
