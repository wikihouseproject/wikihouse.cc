Rails.application.routes.draw do

  %w(nothing google about donate propose_a_pilot library communities_guide community partners technologies tools about_wikihouse_foundation prospectus terms message_received).each do |page|
    get page.gsub("_","-"), to: "static##{page}", as: page
  end

  resources :things, path: 'types'
  resources :enquiries, path: 'contact-us'
  resources :donations

  root to: 'static#landing'
end
