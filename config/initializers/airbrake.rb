Airbrake.configure do |config|
  config.host = ENV.fetch('airbrake_host')
  config.project_id = ENV.fetch('airbrake_project_id') # required, but any positive integer works
  config.project_key = ENV.fetch('airbrake_project_key')

  # Uncomment for Rails apps
  config.environment = Rails.env
  config.ignore_environments = %w(development test)
end
