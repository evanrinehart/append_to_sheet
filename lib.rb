require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'

require 'json'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Sheet Accessor'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = 'tokens.yaml'
SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS

def authorize
  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new( client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    raise "credentials nil"
#    url = authorizer.get_authorization_url( base_url: OOB_URI)
#    puts "Open the following URL in the browser and enter the " +
#         "resulting code after authorization"
#    puts url
#    code = gets
#    credentials = authorizer.get_and_store_credentials_from_code(
#      user_id: user_id,
#      code: code,
#      base_url: OOB_URI
#    )
  end
  credentials
end

def append sheet_id, row
  service = Google::Apis::SheetsV4::SheetsService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize

  service.append_spreadsheet_value(
    sheet_id,
    'A1',
    {values: [row]},
    value_input_option: 'USER_ENTERED'
  )
end

