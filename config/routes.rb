Rails.application.routes.draw do

  %w(about donate propose library community partners technologies tools about_wikihouse_foundation prospectus terms).each do |page|
    get page.gsub("_","-"), to: "static##{page}", as: page
  end

  resources :things, path: 'types'
  resources :enquiries
  resources :donations
  resources :proposals
  resources :donations

  root to: 'static#landing'
end
