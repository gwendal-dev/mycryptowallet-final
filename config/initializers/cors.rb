Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put]
  end
end

Rails.application.config.hosts << "localhost:3000"
