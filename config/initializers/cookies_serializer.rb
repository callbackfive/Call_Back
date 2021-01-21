# Be sure to restart your server when you modify this file.

# Specify a serializer for the signed and encrypted cookie jars.
# Valid options are :json, :marshal, and :hybrid.
Rails.application.config.action_dispatch.cookies_serializer = :json
if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: '_callback', domain: :all, tld_length: 2
end
