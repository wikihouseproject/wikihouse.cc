Rails.application.routes.draw do

  %w(about library community partners products tools about_wikihouse_foundation propose prospectus terms).each do |page|
    get page.gsub("_","-"), to: "static##{page}", as: page
  end

  resources :things, path: 'types'
  resources :enquiries

  root to: 'static#landing'
end
