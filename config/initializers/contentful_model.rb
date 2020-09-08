# frozen_string_literal: true

ContentfulModel.configure do |config|
  config.access_token = Settings.contentful_api.access_token
  config.space = Settings.contentful_api.space
  # config.preview_access_token = "your preview token in here" # Optional - required if you want to use the preview API
  # config.management_token = "your management token in here" # Optional - required if you want to update or create content
  # config.environment = "master" # Optional - defaults to 'master'
  config.default_locale = 'en-US' # Optional - defaults to 'en-US'
  config.options = { # Optional
    # Extra options to send to the Contentful::Client and Contentful::Management::Client
    # See https://github.com/contentful/contentful.rb#configuration

    # Optional:
    # Use `delivery_api` and `management_api` keys to limit to what API the settings
    # will apply. Useful because Delivery API is usually visitor facing, while Management
    # is used in background tasks that can run much longer.
    delivery_api: {
      timeout_read: 6,
      timeout_write: 6,
      timeout_connect: 6
    }
    # management_api: {
    #   timeout_read: 100
    # }
  }
end
