Rails.application.config.action_dispatch.cookies_same_site_protection = :none
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options, :head],
    credentials: true
  end

  allow do
    origins 'https://alleasytrips.herokuapp.com/'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options, :head],
    credentials: true
  end
end