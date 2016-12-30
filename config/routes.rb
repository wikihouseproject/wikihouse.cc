Rails.application.routes.draw do

  %w(nothing google about donate propose_a_pilot communities_guide community partners technologies tools about_wikihouse_foundation prospectus terms message_received).each do |page|
    get page.gsub("_","-"), to: "static##{page}", as: page
  end
  
  get 'library/technologies/:id', to: 'things#index'
  get 'library/technologies/structure/:id', to: 'things#show'

  resources :library_categories, path: 'library' do
    resources :things, path: ''
  end
  resources :enquiries, path: 'contact-us' do
    get 'preview', on: :member
  end

  root to: 'static#landing'
end
