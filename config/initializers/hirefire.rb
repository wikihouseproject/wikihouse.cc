HireFire.configure do |config|
  config.environment      = nil # default in production is :heroku. default in development is :noop
  config.max_workers      = 1   # default is 1
  config.min_workers      = 0   # default is 0
end
