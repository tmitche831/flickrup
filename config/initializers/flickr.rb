Flickr.configure do |config|
  config.pagination    = :will_paginate
  config.api_key       = Rails.application.secrets[:flickr_key]
  config.shared_secret = Rails.application.secrets[:flickr_secret]
end