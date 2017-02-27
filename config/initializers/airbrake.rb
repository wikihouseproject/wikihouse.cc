Airbrake.configure do |config|
  if ENV.has_key?("airbrake_project_id")
    config.host        = ENV.fetch('airbrake_host')
    config.project_id  = ENV.fetch('airbrake_project_id')
    config.project_key = ENV.fetch('airbrake_project_key')
  end

  # Uncomment for Rails apps
  config.environment = Rails.env
  config.ignore_environments = %w(development test)
end
