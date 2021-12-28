
SHOPIFY_API_VERSION = '2021-10'

ShopifyAPI::Base.api_version = SHOPIFY_API_VERSION
ShopifyApp.configure do |config|
  credentials = Rails.application.credentials
  config.application_name = "Social Proof Falcon"
  config.old_secret = ""
  config.scope = "read_products" # Consult this page for more scope options:
                                  # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = false
  config.after_authenticate_job = false
  config.api_version = "2021-10"
  config.shop_session_repository = 'Shop'
  config.api_version = SHOPIFY_API_VERSION
  config.reauth_on_access_scope_changes = true

  config.allow_jwt_authentication = true
  config.allow_cookie_authentication = false
  config.api_key = credentials.dig(:shopify_app, :api_key)
  config.secret = credentials.dig(:shopify_app, :api_secret_key)
  if defined? Rails::Server
    raise('Missing SHOPIFY_API_KEY. See https://github.com/Shopify/shopify_app#requirements') unless config.api_key
    raise('Missing SHOPIFY_API_SECRET. See https://github.com/Shopify/shopify_app#requirements') unless config.secret
  end
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
