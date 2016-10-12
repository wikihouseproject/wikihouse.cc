Rails.application.routes.draw do

  %w(about community).each do |page|
    get page, to: "static##{page}", as: page
  end

  resources :things, path: 'library'

  root to: 'static#landing'
end
